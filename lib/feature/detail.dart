import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
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
      body: Column(
        children: [
          //header
          const TopBarDefault(text: 'Detail'),

          //ListView
          Flexible(
            child: Container(
              height: double.infinity - 100,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 260,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.asset(
                                'assets/images/1024.png',
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  padding: const EdgeInsets.all(5),
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: AppColors.primary,
                                    size: 25,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        height: 80,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('The Aston Vill Hotel',
                              style: tStyle.MediumBoldBlack()),
                          Row(
                            children: [
                              Text('\$200', style: tStyle.MediumBoldBlack()),
                              Text(' /night',
                                  style: tStyle.MediumRegularBlack()),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                          ),
                          Text(
                            'Alice Spings NT 0870',
                            style: tStyle.SmallRegular(),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Description',
                          style: tStyle.MediumBoldBlack(),
                        ),
                      ),
                      Text(
                        'Alice Spings NT 0870',
                        style: tStyle.SmallRegular(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        color: AppColors.white,
        padding:
            const EdgeInsets.only(left: 24, right: 24, bottom: 32, top: 10),
        child: const ButtonPrimary(text: 'Booking now'),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}
