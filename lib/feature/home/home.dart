// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/components/bottom_sheet/bottom_sheet_secondary.dart';
import 'package:booking/components/box/search_box.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/data/location.dart';
import 'package:booking/data/reason.dart';
import 'package:booking/feature/home/bloc/home_bloc.dart';
import 'package:booking/feature/home/bloc/home_event.dart';
import 'package:booking/feature/search/search_page.dart';
import 'package:booking/feature/search_by_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:booking/components/btn/button_icon.dart';
import 'package:booking/feature/detail_hotel/detail_hotel.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import '../../source/number_format.dart';
import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeGetHotelsList());
    getGretting();
  }

  void getGretting() {
    //gretting
    if (context.read<HomeBloc>().dateTime.hour <= 10) {
      gretting = 'Xin chào buổi sáng!';
    } else if (context.read<HomeBloc>().dateTime.hour <= 13) {
      gretting = 'Xin chào buổi trưa!';
    } else if (context.read<HomeBloc>().dateTime.hour <= 17) {
      gretting = 'Xin chào buổi chiều!';
    } else {
      gretting = 'Xin chào buổi tối!';
    }
  }

  DateTimeRange selectedRangeDate = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  int nguoi = 1;
  String thanhPho = 'Lựa chọn điểm đến';
  int soDem = 1;
  int soPhong = 1;
  String gretting = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        List<Hotels> hotelList = state.hotelsList;
        return Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/Herobanner.png',
                  fit: BoxFit.contain,
                ),
              ),
              //header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      gretting,
                      style: tStyle.H1(),
                    ),
                    const ButtonIconWidget(icon: Icons.notifications_rounded)
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 110),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //search
                        SearchBox(
                          contentNameLocation: thanhPho,
                          contentDateTimeCheck:
                              '${DateFormat.yMd().format(startTime)} - ${DateFormat.yMd().format(endTime)}',
                          night: soDem,
                          contentSelectPersonAndRoomType:
                              '$soPhong phòng, $nguoi khách',
                          onTapShowLocation: onTapShowLocation,
                          onTapShowRangeTime: onTapShowRangeTime,
                          onTapSelectPeople: onTapSelectPeople,
                          onTapSearch: onTapSearch,
                          onTapSearchByName: onTapSearchHotelByName,
                        ),

                        //reason
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          color: AppColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 24, bottom: 16),
                                child: Text('Lý do đặt phòng với Booking',
                                    style: tStyle.MediumBoldBlack()),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 24),
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: reasons.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          reasons[index].image,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              3 /
                                              4,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        //popular location
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: AppColors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 16, left: 24, right: 24),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Địa điểm phổ biến',
                                        style: tStyle.MediumBoldBlack()),
                                    Text('Tất cả',
                                        style: tStyle.MediumRegularPrimary()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 24),
                                height: MediaQuery.of(context).size.width - 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: hotelList.length,
                                  itemBuilder: (context, index) {
                                    return HotelWidget(
                                      image: hotelList[index].anhKS,
                                      nameHotel: hotelList[index].tenKS,
                                      addressHotel: hotelList[index].diaChi,
                                      price:
                                          '${NumberFormatUnity.priceFormat(hotelList[index].giaKS)} đ',
                                      star: '5.0',
                                      onTap: () =>
                                          onTapDetail(index, hotelList),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //hàm hiển thị chi tiết khách sạn
  void onTapDetail(index, hotelList) {
    Navigator.pushNamed(
      context,
      DetailHotelPage.routeName,
      arguments: DetailHotelArg(
        hotel: hotelList[index],
        startDate: startTime,
        endDate: endTime,
        people: nguoi,
        room: soPhong,
        night: soDem,
      ),
    );
  }

  //hàm thực hiện lựa chọn địa điểm
  void onTapShowLocation() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 3 / 4,
          width: double.infinity,
          child: Column(
            children: [
              const BottomSheetSecondary(text: 'Chọn địa điểm'),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: location.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(location[index].name),
                      onTap: () {
                        setState(() {
                          thanhPho = location[index].name;
                        });
                        onTapBack();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  //hàm lựa ngày ngày nhận - trả phòng
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

  //hàm lựa chọn loại phòng, số khách
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

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSearch() {
    if (thanhPho != 'Lựa chọn điểm đến' &&
        thanhPho != 'Bạn chưa chọn điểm đến') {
      Navigator.pushNamed(
        context,
        SearchPage.routeName,
        arguments: SearchPageArg(
          nameLocation: thanhPho,
          startDate: startTime,
          endDate: endTime,
          people: nguoi,
          room: soPhong,
          night: soDem,
        ),
      ).then((value) => {
            setState(() {
              soDem = 1;
              soPhong = 1;
              nguoi = 1;
              startTime = DateTime.now();
              endTime = DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day + 1);
            }),
          });
    } else {
      setState(() {
        thanhPho = "Bạn chưa chọn điểm đến";
      });
    }
  }

  void onTapSearchHotelByName() {
    Navigator.pushNamed(context, SearchByName.routeName);
  }
}

class HotelWidget extends StatelessWidget {
  const HotelWidget({
    Key? key,
    required this.image,
    required this.nameHotel,
    required this.addressHotel,
    required this.price,
    required this.star,
    this.onTap,
  }) : super(key: key);
  final String image;
  final String nameHotel;
  final String addressHotel;
  final String price;
  final String star;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        width: MediaQuery.of(context).size.width * 2 / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: image == ''
                  ? Container(
                      height: MediaQuery.of(context).size.width - 50,
                      width: double.infinity,
                      color: AppColors.grey.withOpacity(0.5),
                    )
                  : Image.network(
                      image,
                      height: MediaQuery.of(context).size.width - 50,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              bottom: 5,
              child: Container(
                width: MediaQuery.of(context).size.width * 2 / 3,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nameHotel, style: tStyle.MediumBoldWhite()),
                    const SizedBox(height: 8),
                    Text(addressHotel, style: tStyle.SmallRegularWhite()),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, color: AppColors.yellow),
                            const SizedBox(width: 5),
                            Text(star, style: tStyle.BaseBoldWhite()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('chỉ từ  ', style: tStyle.BaseRegularWhite()),
                            Text(price, style: tStyle.MediumBoldPrimary()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SelectPersonAndRoomType extends StatefulWidget {
  SelectPersonAndRoomType({
    Key? key,
    required this.people,
    required this.room,
    required this.changePeople,
    required this.changeRoom,
  }) : super(key: key);
  int people;
  int room;
  final Function(int valuePeople) changePeople;
  final Function(int valueRoom) changeRoom;

  @override
  State<SelectPersonAndRoomType> createState() =>
      _SelectPersonAndRoomTypeState();
}

class _SelectPersonAndRoomTypeState extends State<SelectPersonAndRoomType> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 3 / 4,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const BottomSheetSecondary(text: 'Chọn số phòng và khách'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: AppColors.grey),
                      const SizedBox(width: 10),
                      Text(
                        'Số lượng phòng',
                        style: tStyle.BaseBoldBlack(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (widget.room > 1) {
                            setState(() {
                              widget.room -= 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('${widget.room}'),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.room += 1;
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: AppColors.grey),
                      const SizedBox(width: 10),
                      Text(
                        'Người',
                        style: tStyle.BaseBoldBlack(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (widget.people > 1) {
                            setState(() {
                              widget.people -= 1;
                            });
                          }
                        },
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('${widget.people}'),
                      ),
                      const SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.people += 1;
                          });
                        },
                        child: const Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
          ButtonPrimary(
            text: 'Hoàn tất',
            onTap: () {
              setState(() {
                widget.changePeople(widget.people);
                widget.changeRoom(widget.room);
              });
              onTapBack();
            },
          )
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}
