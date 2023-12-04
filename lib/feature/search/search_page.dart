// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/feature/detail.dart';
import 'package:flutter/material.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/components/top_bar/topbar_secondary.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

class SearchPageArg {
  final String nameLocation;
  final DateTime startDate;
  final int people;
  final String room;
  final int roomNumber;
  final int night;
  SearchPageArg({
    required this.nameLocation,
    required this.startDate,
    required this.people,
    required this.room,
    required this.roomNumber,
    required this.night,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarDefault(text: widget.arg.nameLocation),
          TopBarSecondary(
              startTime: widget.arg.startDate,
              night: widget.arg.night,
              room: widget.arg.room,
              people: widget.arg.people),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: onTapDetail,
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 12),
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
                              Text('Phòng đôi',
                                  style: tStyle.BaseRegularBlack()),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text("2.000.000 đ",
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
          //không tìm thấy kết quả
          // const NoResult(),
        ],
      ),
    );
  }

  void onTapDetail() {
    Navigator.pushNamed(context, DetailPage.routeName);
  }
}
