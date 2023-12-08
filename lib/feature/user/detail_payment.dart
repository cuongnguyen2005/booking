// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/components/box/info_box.dart';
import 'package:booking/components/box/order_form.dart';
import 'package:flutter/material.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

class DetailPayment extends StatefulWidget {
  const DetailPayment({super.key});
  static String routeName = 'detail_payment';

  @override
  State<DetailPayment> createState() => _DetailPaymentState();
}

class _DetailPaymentState extends State<DetailPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarDefault(
            text: 'Thông tin thanh toán',
            onTap: onTapBack,
          ),
          //
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.yellow.withOpacity(0.2),
                        ),
                        child: Text(
                          'Đang xử lý',
                          style: tStyle.BaseRegularYellow(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const OrderForm(
                        nameHotel: 'Khách sạn AB',
                        night: '2 đêm',
                        people: '2 người',
                        roomType: 'phòng đơn  x 1',
                        checkin: '20/05/2023 (15:00 - 03:00)',
                        checkout: '20/05/2023 (trước 11:00)',
                      )
                    ],
                  ),
                ),
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
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tên khách',
                                  style: tStyle.BaseRegularBlack()),
                              const SizedBox(height: 5),
                              Text('Nguyễn Văn A',
                                  style: tStyle.BaseBoldBlack()),
                            ],
                          )
                        ],
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
                      Text(
                        'Thông tin liên hệ',
                        style: tStyle.BaseBoldBlack(),
                      ),
                      const SizedBox(height: 16),
                      const InfoBox(title: 'Họ tên', content: 'Nguyễn Văn A'),
                      const SizedBox(height: 10),
                      const InfoBox(
                          title: 'Số điện thoại', content: '0354637625'),
                      const SizedBox(height: 10),
                      const InfoBox(title: 'Email', content: 'demo@gmail.com'),
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
                        'Chi tiết giá',
                        style: tStyle.BaseBoldBlack(),
                      ),
                      const SizedBox(height: 16),
                      const InfoBox(title: 'Giá phòng', content: '2.000.000 đ'),
                      const SizedBox(height: 10),
                      const InfoBox(title: 'Số phòng', content: 'x 1'),
                      const SizedBox(height: 10),
                      const InfoBox(
                          title: 'Tổng số tiền', content: '2.000.000 đ'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}
