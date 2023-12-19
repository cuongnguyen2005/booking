// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/components/dialog/no_results.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/source/call_api/booking_api.dart';
import 'package:flutter/material.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/components/top_bar/topbar_secondary.dart';
import 'package:booking/feature/user/detail_hotel.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

class SearchPageArg {
  final String nameLocation;
  final DateTime startDate;
  final int people;
  final String roomType;
  final int roomTypeNumber;
  final int roomNumber;
  final int night;
  final String locationCode;
  SearchPageArg({
    required this.nameLocation,
    required this.startDate,
    required this.people,
    required this.roomType,
    required this.roomTypeNumber,
    required this.roomNumber,
    required this.night,
    required this.locationCode,
  });
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.arg});
  final SearchPageArg arg;
  static String routeName = 'search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    getListHotels();
  }

  List<Hotels> hotelList = [];
  void getListHotels() async {
    List<Hotels> listHotelApi = await BookingRepo.getHotels();
    setState(() {
      hotelList = listHotelApi
          .where(
            (element) =>
                element.maDiaDiem
                    .toLowerCase()
                    .contains(widget.arg.locationCode.toLowerCase()) &&
                element.roomTypeNumber == widget.arg.roomTypeNumber,
          )
          .toList();
      if (hotelList == []) {
        isCheckHotelList = false;
      } else {
        isCheckHotelList = true;
      }
    });
  }

  bool isCheckHotelList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarDefault(text: widget.arg.nameLocation, onTap: onTapBack),
          TopBarSecondary(
            startTime: widget.arg.startDate,
            night: widget.arg.night,
            room: widget.arg.roomType,
            people: widget.arg.people,
            onTap: onTapShowSearchBox,
          ),
          if (isCheckHotelList == true)
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 12),
                shrinkWrap: true,
                itemCount: hotelList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: onTapDetail,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.white,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/1024.png',
                              width: 120,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tên khách sạn demo',
                                    style: tStyle.BaseRegularBlack()),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ),
                                    const SizedBox(width: 5),
                                    Text('5', style: tStyle.BaseRegularBlack()),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Phòng ${hotelList[index].roomType}',
                                    style: tStyle.BaseRegularBlack()),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text('${hotelList[index].gia} đ',
                                        style: tStyle.BaseBoldPrimary()),
                                    Text(' / phòng / đêm',
                                        style: tStyle.SmallRegular())
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          if (isCheckHotelList == false)
            // không tìm thấy kết quả
            const NoResult(),
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapDetail() {
    Navigator.pushNamed(context, DetailHotelPage.routeName);
  }

  void onTapShowSearchBox() {
    // Navigator.pushNamed(context, routeName)
  }
}
