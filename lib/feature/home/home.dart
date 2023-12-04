// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/components/bottom_sheet/bottom_sheet_secondary.dart';
import 'package:booking/components/box/search_box_secondary.dart';
import 'package:booking/data/location.dart';
import 'package:booking/data/reason.dart';
import 'package:booking/feature/home/widget/location_big_widget.dart';
import 'package:booking/feature/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:booking/components/box/search_box_primary.dart';
import 'package:booking/components/btn/button_icon.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/feature/detail.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getTextHello();
  }

  void getTextHello() {
    if (dateTime.hour >= 0 && dateTime.hour <= 11) {
      setState(() {
        helloText = 'Xin chào buổi sáng!';
      });
    } else if (dateTime.hour >= 12 && dateTime.hour < 18) {
      setState(() {
        helloText = 'Xin chào buổi trưa!';
      });
    } else {
      setState(() {
        helloText = 'Xin chào buổi tối!';
      });
    }
  }

  DateTimeRange selectedRangeDate = DateTimeRange(
    start: DateTime.now(),
    end: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
  );

  final DateTime dateTime = DateTime.now();
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  String helloText = '';
  int people = 1;
  String nameLocation = 'Lựa chọn điểm đến';
  int roomNumber = 1;
  String room = 'đơn';
  int night = 1;
  int roomN = 1;

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  helloText,
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
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.white,
                      ),
                      child: Column(
                        children: [
                          SearchBoxPrimary(
                            title: 'Điểm đến',
                            content: nameLocation,
                            icon: Icons.location_on,
                            onTap: onTapShowLocation,
                          ),
                          const SizedBox(height: 10),
                          SearchBoxSecondary(
                            title: 'Ngày nhận - trả phòng',
                            content:
                                '${DateFormat.yMd().format(startTime)} - ${DateFormat.yMd().format(endTime)}',
                            icon: Icons.calendar_month,
                            night: night,
                            onTap: onTapShowRangeTime,
                          ),
                          const SizedBox(height: 10),
                          SearchBoxPrimary(
                            title: 'Loại phòng và khách',
                            content: 'phòng $room x $roomN, $people khách',
                            icon: Icons.person_add,
                            onTap: onTapSelectPeople,
                          ),
                          const SizedBox(height: 10),
                          ButtonPrimary(
                            text: 'Tìm kiếm',
                            onTap: onTapSearch,
                          ),
                        ],
                      ),
                    ),

                    //list popular location
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 24, left: 24, top: 24, bottom: 16),
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
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 12),
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.primary,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(reasons[index].icon,
                                    size: 30, color: AppColors.white),
                                const SizedBox(height: 10),
                                Text(reasons[index].text,
                                    textAlign: TextAlign.center,
                                    style: tStyle.BaseRegularWhite())
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    //popular location
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 24, left: 24, top: 24, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Địa điểm phổ biến',
                              style: tStyle.MediumBoldBlack()),
                          Text('Tất cả', style: tStyle.MediumRegularPrimary()),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 24),
                      height: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return LocationBigWidget(
                            image: 'assets/images/1024.png',
                            nameHotel: 'The Aston Vill Hotel',
                            addressHotel: 'Alice Spings NT 0870 Australia',
                            price: '\$200,7',
                            star: '5.0',
                            onTap: onTapDetail,
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  //hàm hiển thị chi tiết khách sạn
  void onTapDetail() {
    Navigator.pushNamed(context, DetailPage.routeName);
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
                          nameLocation = location[index].name;
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
        night = dateTimeRange.duration.inDays;
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
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 3 / 4,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const BottomSheetSecondary(
                          text: 'Chọn loại phòng và khách'),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.door_sliding,
                                  color: AppColors.grey),
                              const SizedBox(width: 10),
                              Text(
                                'Loại phòng',
                                style: tStyle.BaseBoldBlack(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 2,
                                  groupValue: roomNumber,
                                  title: const Text('Đôi'),
                                  onChanged: (value) {
                                    setModalState(() {
                                      roomNumber = int.parse(value.toString());
                                      room = 'đôi';
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: RadioListTile(
                                  value: 1,
                                  groupValue: roomNumber,
                                  title: const Text('Đơn'),
                                  onChanged: (value) {
                                    setModalState(() {
                                      roomNumber = int.parse(value.toString());
                                      room = 'đơn';
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
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
                                'Số lượng phòng',
                                style: tStyle.BaseBoldBlack(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (roomN > 0) {
                                    setModalState(() {
                                      roomN -= 1;
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('$roomN'),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  setModalState(() {
                                    roomN += 1;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                            ],
                          )
                        ],
                      ),
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
                                  if (people > 0) {
                                    setModalState(() {
                                      people -= 1;
                                    });
                                  }
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('$people'),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                onPressed: () {
                                  setModalState(() {
                                    people += 1;
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
                        people;
                        room;
                        roomNumber;
                        roomN;
                      });
                      onTapBack();
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSearch() {
    if (nameLocation != 'Lựa chọn điểm đến' &&
        nameLocation != 'Bạn chưa chọn điểm đến') {
      Navigator.pushNamed(
        context,
        SearchPage.routeName,
        arguments: SearchPageArg(
          nameLocation: nameLocation,
          startDate: startTime,
          people: people,
          room: room,
          roomNumber: roomNumber,
          night: night,
        ),
      );
    } else {
      setState(() {
        nameLocation = "Bạn chưa chọn điểm đến";
      });
    }
  }
}
