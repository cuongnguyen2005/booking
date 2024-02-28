// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/feature/home/home.dart';
import 'package:booking/feature/search/bloc/search_bloc.dart';
import 'package:booking/feature/search/bloc/search_event.dart';
import 'package:flutter/material.dart';
import 'package:booking/components/dialog/no_results.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/components/top_bar/topbar_secondary.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/feature/detail_hotel/detail_hotel.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../source/number_format.dart';
import 'bloc/search_state.dart';

class SearchPageArg {
  final String nameLocation;
  final DateTime startDate;
  final DateTime endDate;
  final int people;
  final int room;
  final int night;
  final String locationCode;
  SearchPageArg({
    required this.nameLocation,
    required this.startDate,
    required this.endDate,
    required this.people,
    required this.room,
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
    getResult();
    startTime = widget.arg.startDate;
    endTime = widget.arg.endDate;
    nguoi = widget.arg.people;
    soDem = widget.arg.night;
    soPhong = widget.arg.room;
  }

  void getResult() {
    context.read<SearchBloc>().add(SearchGetHotelEvent(widget: widget));
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
  int soDem = 1;
  int soPhong = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarDefault(text: widget.arg.nameLocation, onTap: onTapBack),
          TopBarSecondary(
            startTime: startTime,
            night: soDem,
            people: nguoi,
            room: soPhong,
            onTapSelectDay: onTapShowRangeTime,
            onTapSelectPeople: onTapSelectPeople,
          ),
          BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state is SearchLoadingState) {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ));
                    });
              }
              if (state is SearchDeleteLoadingState) {
                onTapBack();
              }
              if (state is SearchNoResultsState) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const NoResult();
                    });
              }
            },
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                List<Hotels> hotelList = state.listHotelByCondition;

                return Flexible(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 12),
                    shrinkWrap: true,
                    itemCount: hotelList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => onTapDetail(index, hotelList),
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
                                child: hotelList[index].anhKS == ''
                                    ? Container(
                                        width: 120,
                                        height: 120,
                                        color: AppColors.grey.withOpacity(0.5),
                                      )
                                    : Image.network(
                                        hotelList[index].anhKS,
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(hotelList[index].tenKS,
                                        style: tStyle.MediumBoldBlack()),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: const [
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(hotelList[index].diaChi,
                                        style: tStyle.BaseRegularBlack()),
                                    const SizedBox(height: 16),
                                    Row(
                                      children: [
                                        Text('chỉ từ ',
                                            style: tStyle.SmallRegularBlack()),
                                        Text(
                                            '${NumberFormatUnity.priceFormat(hotelList[index].giaKS)} đ',
                                            style: tStyle.MediumBoldPrimary()),
                                        Text(' / phòng / đêm',
                                            style: tStyle.SmallRegularBlack()),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapDetail(index, hotelList) {
    Navigator.pushNamed(context, DetailHotelPage.routeName,
        arguments: DetailHotelArg(
          hotel: hotelList[index],
          startDate: startTime,
          endDate: endTime,
          people: nguoi,
          room: soPhong,
          night: soDem,
        ));
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
