// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/data/user_account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:booking/components/bottom_sheet/bottom_sheet_default.dart';
import 'package:booking/components/text_field/box_input.dart';
import 'package:booking/components/text_field/text_field_default.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/feature/user/book/checkout.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:booking/source/utils/validate_util.dart';

class CustomerInfoArg {
  final Hotels hotel;
  final DateTime startDate;
  final DateTime endDate;
  final int people;
  final String roomType;
  final int roomTypeNumber;
  final int room;
  final int night;
  CustomerInfoArg({
    required this.hotel,
    required this.startDate,
    required this.endDate,
    required this.people,
    required this.roomType,
    required this.roomTypeNumber,
    required this.room,
    required this.night,
  });
}

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({
    Key? key,
    required this.arg,
  }) : super(key: key);
  final CustomerInfoArg arg;
  static String routeName = 'customer_info';

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  @override
  void initState() {
    caculateMoney();
    super.initState();
    getInfo();
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserAccount? usersAccount;
  void getInfo() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      setState(() {
        usersAccount = UserAccount.fromMap(value.data());
      });
    });
  }

  void caculateMoney() {
    setState(() {
      totalMoney = widget.arg.hotel.gia * widget.arg.night * widget.arg.room;
    });
  }

  int totalMoney = 0;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thông tin liên hệ',
                              style: tStyle.MediumBoldBlack(),
                            ),
                            const SizedBox(height: 16),
                            BoxInput(
                              title: 'Họ tên',
                              inputDefault: InputDefault(
                                controller: nameController,
                                hintText: 'Ví dụ: Nguyễn Văn A',
                                obscureText: false,
                                validator: ValidateUntils.validateName,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            BoxInput(
                              title: 'Số điện thoại',
                              inputDefault: InputDefault(
                                controller: phoneNumberController,
                                hintText: 'Ví dụ: 0349645382',
                                obscureText: false,
                                validator: ValidateUntils.validatePhonenumber,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                            BoxInput(
                              title: 'Email',
                              inputDefault: InputDefault(
                                controller: emailController,
                                hintText: 'Ví dụ: demo@gmail.com',
                                obscureText: false,
                                validator: ValidateUntils.validateEmail,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                            ),
                          ],
                        ),
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
        money: totalMoney,
        textButton: 'Tiếp tục',
        onTap: onTapCheckout,
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapCheckout() {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        Checkout.routeName,
        arguments: CheckoutArg(
          hotel: widget.arg.hotel,
          name: nameController.text,
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
          startDate: widget.arg.startDate,
          endDate: widget.arg.endDate,
          people: widget.arg.people,
          roomType: widget.arg.roomType,
          roomTypeNumber: widget.arg.roomTypeNumber,
          room: widget.arg.room,
          night: widget.arg.night,
          totalMoney: totalMoney,
        ),
      );
    }
  }
}
