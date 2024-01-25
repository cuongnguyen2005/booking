// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/booking_bloc.dart';

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
    totalMoney = widget.arg.hotel.gia * widget.arg.night * widget.arg.room;
    super.initState();
  }

  int totalMoney = 0;

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
                        key: context.read<BookingBloc>().formKey,
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
                                controller:
                                    context.read<BookingBloc>().nameController,
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
                                controller: context
                                    .read<BookingBloc>()
                                    .phoneNumberController,
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
                                controller:
                                    context.read<BookingBloc>().emailController,
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
    if (context.read<BookingBloc>().formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        Checkout.routeName,
        arguments: CheckoutArg(
          hotel: widget.arg.hotel,
          name: context.read<BookingBloc>().nameController.text,
          email: context.read<BookingBloc>().emailController.text,
          phoneNumber: context.read<BookingBloc>().phoneNumberController.text,
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
