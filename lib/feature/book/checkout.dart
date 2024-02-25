// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:booking/data/rooms.dart';
import 'package:booking/source/call_api/booking_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:booking/components/bottom_sheet/bottom_sheet_default.dart';
import 'package:booking/components/box/info_box.dart';
import 'package:booking/components/box/order_form.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/feature/book/payment_success.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'bloc/booking_bloc.dart';

class CheckoutArg {
  final Rooms room;
  final String name;
  final String email;
  final String phoneNumber;
  final DateTime startDate;
  final DateTime endDate;
  final int people;
  final String roomType;
  final int soLuongPhong;
  final int night;
  final int totalMoney;
  CheckoutArg({
    required this.room,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.startDate,
    required this.endDate,
    required this.people,
    required this.roomType,
    required this.soLuongPhong,
    required this.night,
    required this.totalMoney,
  });
}

class Checkout extends StatefulWidget {
  const Checkout({
    Key? key,
    required this.arg,
  }) : super(key: key);
  final CheckoutArg arg;
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
                      OrderForm(
                        nameHotel: widget.arg.room.tenPhong,
                        night: '${widget.arg.night} đêm',
                        people: '${widget.arg.people} người',
                        roomType:
                            'phòng ${widget.arg.room.kieuPhong}  x ${widget.arg.soLuongPhong}',
                        checkin:
                            '${DateFormat.yMd().format(widget.arg.startDate)} (15:00 - 03:00)',
                        checkout:
                            '${DateFormat.yMd().format(widget.arg.endDate)} (trước 11:00)',
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
                              Text(widget.arg.name,
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
                      InfoBox(title: 'Họ tên', content: widget.arg.name),
                      const SizedBox(height: 10),
                      InfoBox(
                          title: 'Số điện thoại',
                          content: widget.arg.phoneNumber),
                      const SizedBox(height: 10),
                      InfoBox(title: 'Email', content: widget.arg.email),
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
        money: widget.arg.totalMoney,
        textButton: 'Thanh toán',
        onTap: onTapPayment,
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapPayment() async {
    await BookingRepo.saveNotification(
        widget.arg.room.tenPhong, DateTime.now(), widget.arg.startDate);
    await BookingRepo.bookingHotel(
      context.read<BookingBloc>().user!.uid,
      widget.arg.name,
      widget.arg.email,
      widget.arg.phoneNumber,
      widget.arg.startDate,
      widget.arg.endDate,
      widget.arg.night,
      widget.arg.people,
      widget.arg.soLuongPhong,
      widget.arg.totalMoney,
      widget.arg.room.idKS,
      widget.arg.room.tenPhong,
      widget.arg.room.giaPhong,
      widget.arg.room.kieuPhong,
      widget.arg.room.maKS,
    );
    onTapPaymentSuccess();
  }

  void onTapPaymentSuccess() {
    Navigator.pushNamed(
      context,
      PaymentSuccess.routeName,
      arguments: widget.arg.totalMoney,
    );
  }
}
