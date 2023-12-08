import 'package:booking/components/box/info_box.dart';
import 'package:booking/components/btn/button_outline.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});
  static String routeName = 'payment_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 100,
            ),
            Image.asset('assets/images/payment.png'),
            const SizedBox(height: 10),
            Text('Đặt phòng thành công!', style: tStyle.MediumBoldGreen()),
            const SizedBox(height: 24),
            const InfoBox(title: 'Thông tin thanh toán', content: 'Trực tiếp'),
            const SizedBox(height: 10),
            const InfoBox(title: 'Số tiền', content: '2.000.000 đ'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ButtonOutline(
                    text: 'Về trang chủ',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: ButtonPrimary(
                    text: 'Chi tiết đặt chỗ',
                    onTap: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
