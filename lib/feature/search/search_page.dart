import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/components/top_bar/topbar_secondary.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
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
          const TopBarDefault(text: 'Hà Nội'),
          const TopBarSecondary(),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              shrinkWrap: true,
              itemCount: 3,
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
          )
        ],
      ),
    );
  }

  void onTapDetail() {}
}
