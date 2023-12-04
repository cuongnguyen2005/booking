// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

import '../../components/bottom_sheet/bottom_sheet_default.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});
  static String routeName = 'checkout';

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBarDefault(text: 'Thông tin thanh toán'),
          const SizedBox(height: 8),
          //
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chi tiết đơn hàng',
                        style: tStyle.MediumBoldBlack(),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            color: AppColors.primary),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.other_houses,
                              color: AppColors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Khách sạn AB',
                              style: tStyle.BaseRegularWhite(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.lightGrey)),
                        child: Column(
                          children: const [
                            ListBundle(
                                icon: Icons.brightness_2,
                                title: 'Số đêm',
                                content: '2 đêm'),
                            SizedBox(height: 10),
                            ListBundle(
                                icon: Icons.people,
                                title: 'Khách',
                                content: '2 người'),
                            SizedBox(height: 8),
                            ListBundle(
                                icon: Icons.bed_outlined,
                                title: 'Loại phòng',
                                content: 'phòng đơn  x 1'),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: AppColors.lightGrey),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: const [
                            ListBundle(
                                icon: Icons.timer,
                                title: 'Nhận phòng',
                                content: '20/05/2023 (15:00 - 03:00)'),
                            SizedBox(height: 10),
                            ListBundle(
                                icon: Icons.timer,
                                title: 'Trả phòng',
                                content: '20/05/2023 (trước 11:00)'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phương thức thanh toán',
                            style: tStyle.BaseBoldBlack(),
                          ),
                          const Icon(Icons.arrow_forward_ios,
                              size: 15, color: AppColors.grey)
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('VIB ***098'),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin khách hàng',
                        style: tStyle.BaseBoldBlack(),
                      ),
                      const SizedBox(height: 10),
                      const ListBundle(
                          icon: Icons.person,
                          title: 'Tên khách',
                          content: 'Nguyễn Văn A'),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin liên hệ',
                        style: tStyle.BaseBoldBlack(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Họ tên', style: tStyle.BaseRegularBlack()),
                          Text('Nguyễn Văn A', style: tStyle.BaseBoldBlack())
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Số điện thoại',
                              style: tStyle.BaseRegularBlack()),
                          Text('0354637625', style: tStyle.BaseBoldBlack())
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Email', style: tStyle.BaseRegularBlack()),
                          Text('demo@gmail.com', style: tStyle.BaseBoldBlack())
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 150),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheetDefault(
        title: 'Tổng số tiền',
        money: 2000000,
        textButton: 'Tiếp tục',
        onTap: () {},
      ),
    );
  }
}

class ListBundle extends StatelessWidget {
  const ListBundle({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: tStyle.BaseRegularBlack()),
            const SizedBox(height: 5),
            Text(content, style: tStyle.BaseBoldBlack()),
          ],
        )
      ],
    );
  }
}
