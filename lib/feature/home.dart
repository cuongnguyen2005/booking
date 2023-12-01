import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              //header
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 26, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Good morning!',
                      style: tStyle.LargeMedium(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.ring_volume_sharp),
                    )
                  ],
                ),
              ),

              //search
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColors.lightGrey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: AppColors.grey,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Search Hotels',
                            style: tStyle.MediumMedium(),
                          )
                        ],
                      ),
                      const Icon(Icons.select_all)
                    ],
                  ),
                ),
              ),

              //location
              Padding(
                padding: const EdgeInsets.only(
                    right: 24, left: 24, top: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nearby your location', style: tStyle.LargeMedium()),
                    Text('See all', style: tStyle.MediumMedium()),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGrey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(5, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(left: 24),
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 16),
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
                            child: Image.asset(
                              'assets/images/1024.png',
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('The Aston Vill Hotel',
                                        style: tStyle.LargeMedium()),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                        ),
                                        const SizedBox(width: 8),
                                        Text('5.0',
                                            style: tStyle.LargeMedium()),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Alice Spings NT 0870 Australia',
                                    style: tStyle.SmallMedium()),
                                const SizedBox(height: 8),
                                Text('\$200,7', style: tStyle.MediumBold()),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),

              //list popular location
              Padding(
                padding: const EdgeInsets.only(
                    right: 24, left: 24, top: 24, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular location', style: tStyle.LargeMedium()),
                    Text('See all', style: tStyle.MediumMedium()),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightGrey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(5, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.only(left: 24),
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: MediaQuery.of(context).size.width * 8 / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/1024.png',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width:
                                MediaQuery.of(context).size.width * 8 / 9 - 120,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('The Aston Vill Hotel',
                                    style: tStyle.LargeMedium()),
                                const SizedBox(height: 8),
                                Text('Alice Spings NT 0870 Australia',
                                    style: tStyle.SmallMedium()),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$200,7', style: tStyle.MediumBold()),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: AppColors.yellow,
                                        ),
                                        Text('5.0',
                                            style: tStyle.LargeMedium()),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          )
        ],
      ),
    );
  }
}
