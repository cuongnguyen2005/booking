import 'package:booking/components/text_field/text_field_default.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/feature/detail_hotel/detail_hotel.dart';
import 'package:booking/source/call_api/booking_api.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/number_format.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:tiengviet/tiengviet.dart';

class SearchByName extends StatefulWidget {
  const SearchByName({super.key});
  static String routeName = "search_by_name";

  @override
  State<SearchByName> createState() => _SearchByNameState();
}

class _SearchByNameState extends State<SearchByName> {
  @override
  void initState() {
    super.initState();
  }

  List<Hotels> hotelList = [];
  void getHotels(String value) async {
    List<Hotels> hotelListApi = await BookingRepo.getHotels();
    setState(() {
      hotelList = hotelListApi
          .where((element) => element.codeTenKS
              .toLowerCase()
              .contains((TiengViet.parse(value)).toLowerCase()))
          .toList();
    });
  }

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
          TopBarDefault(
            text: 'Tim kiem khach san',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InputDefault(
              hintText: 'Tìm kiếm khách sạn ban muốn đi',
              obscureText: false,
              prefixIcon: const Icon(Icons.search),
              onChanged: (value) => getHotels(value),
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              shrinkWrap: true,
              itemCount: hotelList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => onTapDetail(index, hotelList),
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
          ),
        ],
      ),
    );
  }

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
}
