// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/components/top_bar/topbar_secondary.dart';
import 'package:booking/data/rooms.dart';
import 'package:booking/data/user_account.dart';
import 'package:booking/feature/home/widget/select_person_roomtype.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:intl/intl.dart';
import '../../components/dialog/dialog_primary.dart';
import '../book/customer_info.dart';
import '../login/login.dart';
import 'bloc/room_bloc.dart';
import 'bloc/room_event.dart';
import 'bloc/room_state.dart';

class RoomManage extends StatefulWidget {
  const RoomManage({
    Key? key,
    this.hotel,
  }) : super(key: key);
  final Hotels? hotel;
  static String routeName = 'room_manage';

  @override
  State<RoomManage> createState() => _RoomManageState();
}

class _RoomManageState extends State<RoomManage> {
  @override
  void initState() {
    super.initState();
    getListRoom();
    getInfoUser();
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserAccount? usersAccount;
  void getInfoUser() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      setState(() {
        usersAccount = UserAccount.fromMap(value.data());
      });
    });
  }

  DateTime dateTime = DateTime.now();
  DateTimeRange selectedRangeDate = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  int nguoi = 1;
  int soDem = 1;
  int soPhong = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RoomBloc, RoomState>(
      listener: (context, state) {
        if (state is RoomLoadingState) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            },
          );
        }
        if (state is RoomRemoveLoadingState) {
          onTapBack();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            TopBarDefault(
              text: widget.hotel!.tenKS,
              text_2: widget.hotel!.diaChi,
              onTap: onTapBack,
            ),
            TopBarSecondary(
              startTime: startTime,
              night: soDem,
              people: nguoi,
              room: soPhong,
              onTapSelectDay: onTapShowRangeTime,
              onTapSelectPeople: onTapSelectPeople,
            ),
            Flexible(
              child: BlocBuilder<RoomBloc, RoomState>(
                builder: (context, state) {
                  List<Rooms> roomsList = state.roomsList;
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 24),
                    itemCount: roomsList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => onTapCustomerInfo(index, roomsList),
                        child: Container(
                          margin: const EdgeInsets.only(
                              bottom: 24, left: 24, right: 24),
                          width: MediaQuery.of(context).size.width * 3 / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.white,
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: roomsList[index].anhPhong == ''
                                    ? Container(
                                        height: 250,
                                        width: double.infinity,
                                        color: AppColors.grey.withOpacity(0.5),
                                      )
                                    : Image.network(
                                        roomsList[index].anhPhong,
                                        height: 250,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(roomsList[index].tenPhong,
                                        style: tStyle.MediumBoldBlack()),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.bed,
                                          color: AppColors.red,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                            'giường ${roomsList[index].kieuPhong}',
                                            style: tStyle.BaseRegularBlack()),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.rule_sharp,
                                          color: AppColors.red,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text('25 m2',
                                            style: tStyle.BaseRegularBlack()),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.wifi,
                                          color: AppColors.green,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 5),
                                        Text('wifi miễn phí',
                                            style: tStyle.BaseRegularBlack()),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.money,
                                          color: AppColors.green,
                                          size: 25,
                                        ),
                                        const SizedBox(width: 5),
                                        Text('${NumberFormat.decimalPattern().format(roomsList[index].giaPhong)} đ',
                                            style: tStyle.MediumBoldPrimary()),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    ButtonPrimary(
                                      text: 'Đặt phòng',
                                      onTap: () =>
                                          onTapCustomerInfo(index, roomsList),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapCustomerInfo(index, roomsList) {
    if (user != null) {
      Navigator.pushNamed(
        context,
        CustomerInfo.routeName,
        arguments: CustomerInfoArg(
          room: roomsList[index],
          startDate: startTime,
          endDate: endTime,
          people: nguoi,
          soLuongPhong: soPhong,
          night: soDem,
          userAccount: usersAccount!,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return DialogPrimary(
            content: 'Bạn phải đăng nhập trước khi đặt phòng!',
            buttonText: 'Đồng ý',
            onTap: () {
              Navigator.pushNamed(context, LoginPage.routeName);
            },
          );
        },
      );
    }
  }

  void getListRoom() {
    context.read<RoomBloc>().add(RoomGetHotelsListEvent(widget: widget));
  }

  void onTapShowRangeTime() async {
    final DateTimeRange? dateTimeRange = await showDateRangePicker(
      context: context,
      initialDateRange: selectedRangeDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (dateTimeRange != null) {
      setState(() {
        selectedRangeDate = dateTimeRange;
        startTime = dateTimeRange.start;
        endTime = dateTimeRange.end;
        soDem = dateTimeRange.duration.inDays;
      });
    }
  }

  void onTapSelectPeople() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return SelectPersonAndRoomType(
          people: nguoi,
          room: soPhong,
          changePeople: (valuePeople) {
            nguoi = valuePeople;
            setState(() {});
          },
          changeRoom: (valueRoom) {
            soPhong = valueRoom;
            setState(() {});
          },
        );
      },
    );
  }
}
