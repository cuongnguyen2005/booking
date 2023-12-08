import 'package:booking/components/bottom_sheet/bottom_sheet_default.dart';
import 'package:booking/components/text_field/text_field_default.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/feature/user/book/checkout.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({super.key});
  static String routeName = 'customer_info';

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarDefault(
            text: 'Thông tin khách hàng',
            onTap: onTapBack,
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thông tin liên hệ',
                            style: tStyle.MediumBoldBlack(),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Họ tên',
                            style: tStyle.MediumBoldBlack(),
                          ),
                          const SizedBox(height: 8),
                          const InputDefault(
                              hintText: 'Ví dụ: Nguyễn Văn A',
                              obscureText: false),
                          const SizedBox(height: 16),
                          Text(
                            'Số điện thoại',
                            style: tStyle.MediumBoldBlack(),
                          ),
                          const SizedBox(height: 8),
                          const InputDefault(
                              hintText: 'Ví dụ: 0349645382',
                              obscureText: false),
                          const SizedBox(height: 16),
                          Text(
                            'Email',
                            style: tStyle.MediumBoldBlack(),
                          ),
                          const SizedBox(height: 8),
                          const InputDefault(
                              hintText: 'Ví dụ: demo@gmail.com',
                              obscureText: false),
                        ],
                      ),
                    ),
                    Container(height: 150),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheetDefault(
        title: 'Tổng số tiền',
        money: 2000000,
        textButton: 'Tiếp tục',
        onTap: onTapCheckout,
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapCheckout() {
    Navigator.pushNamed(context, Checkout.routeName);
  }
}
