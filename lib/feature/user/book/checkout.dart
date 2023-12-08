// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/components/bottom_sheet/bottom_sheet_default.dart';
import 'package:booking/components/box/info_box.dart';
import 'package:booking/components/box/order_form.dart';
import 'package:booking/feature/user/book/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

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
          TopBarDefault(text: 'Thông tin thanh toán', onTap: onTapBack),
          //
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 8),
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
                const SizedBox(height: 150),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheetDefault(
        title: 'Tổng số tiền',
        money: 2000000,
        textButton: 'Thanh toán',
        onTap: onTapPayment,
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapPayment() {
    Navigator.pushNamed(context, PaymentSuccess.routeName);
  }
}
