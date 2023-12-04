import 'package:booking/components/bottom_sheet/bottom_sheet_default.dart';
import 'package:booking/components/top_bar/topbar_no_background.dart';
import 'package:booking/feature/book/customer_info.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});
  static String routeName = 'detail_page';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 1 / 3,
                child: Image.asset(
                  'assets/images/1024.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              //content
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Text('The Aston Vill Hotel',
                              style: tStyle.MediumBoldBlack()),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: onTapBookmark,
                              child: const Icon(Icons.bookmark,
                                  color: AppColors.red)),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                        ),
                        Text('5.0', style: tStyle.BaseRegularBlack())
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                        ),
                        Text(
                          'Alice Spings NT 0870',
                          style: tStyle.BaseRegularBlack(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tiện nghi', style: tStyle.MediumBoldBlack()),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.lightPrimary),
                            child: Row(
                              children: [
                                const Icon(Icons.wifi),
                                const SizedBox(width: 8),
                                Text(
                                  'Free Wifi',
                                  style: tStyle.SmallRegular(),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Giờ nhận / trả phòng',
                        style: tStyle.MediumBoldBlack()),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: 5),
                            Text('Nhận phòng', style: tStyle.BaseRegularBlack())
                          ],
                        ),
                        Text('15:00 - 03:00', style: tStyle.BaseBoldBlack()),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: AppColors.grey,
                            ),
                            const SizedBox(width: 5),
                            Text('Trả phòng', style: tStyle.BaseRegularBlack())
                          ],
                        ),
                        Text('Trước 11:00', style: tStyle.BaseBoldBlack()),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                color: AppColors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mô tả khách sạn',
                      style: tStyle.MediumBoldBlack(),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Nằm dọc theo bãi biển Mỹ Khê cát trắng trải dài thơ mộng, khu nghỉ dưỡng dành cho gia đình sang trọng bật nhất thế giới Premier Village Danang được ưu ái tọa lạc ở vị trí đắc địa, hưởng trọn khung cảnh nên thơ của thành phố biển Đà Nẵng xinh đẹp. Với diện tích 1 quần đảo',
                      style: tStyle.BaseRegularBlack(),
                    )
                  ],
                ),
              ),
              Container(height: 150)
            ],
          ),

          //topbar
          const TopBarNoBackground(text: ''),
        ],
      ),
      bottomSheet: BottomSheetDefault(
        title: 'Giá phòng mỗi đêm',
        money: 2000000,
        textButton: 'Đặt phòng ngay',
        onTap: onTapCustomerInfo,
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapCustomerInfo() {
    Navigator.pushNamed(context, CustomerInfo.routeName);
  }

  void onTapBookmark() {}
}
