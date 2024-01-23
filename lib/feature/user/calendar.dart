import 'package:booking/components/top_bar/topbar_third.dart';
import 'package:booking/data/booking.dart';
import 'package:booking/feature/user/detail_payment.dart';
import 'package:booking/source/call_api/booking_api.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  void initState() {
    super.initState();
    getBooking();
  }

  User? user = FirebaseAuth.instance.currentUser;

  List<Booking> bookingList = [];
  void getBooking() async {
    List<Booking> listBooking = await BookingRepo.getBookingByUser(user!.uid);
    bookingList = [];
    for (var element in listBooking) {
      if (element.ngayNhan.month == today.month &&
          element.ngayNhan.year == today.year) {
        setState(() {
          bookingList.add(element);
        });
      }
    }
  }

  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBarThird(text: 'Lịch trình của bạn'),
          Container(
            color: AppColors.white,
            child: TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.monday,
              rowHeight: 40,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              focusedDay: today,
              firstDay: DateTime.utc(2000),
              lastDay: DateTime.utc(2050),
              onPageChanged: (focusedDay) {
                setState(() {
                  today = focusedDay;
                  getBooking();
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: bookingList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMd().format(bookingList[index].ngayNhan),
                        style: tStyle.MediumBoldBlack(),
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: () => onTapDetailPayment(index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.white,
                          ),
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
                                child: Text(bookingList[index].tenTrangThai,
                                    style: tStyle.BaseRegularYellow()),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                decoration: const BoxDecoration(
                                    border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: AppColors.lightGrey),
                                )),
                                child: Row(
                                  children: [
                                    const Icon(Icons.home),
                                    const SizedBox(width: 10),
                                    Text(bookingList[index].tenKS,
                                        style: tStyle.BaseBoldBlack()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 12),
                                width: double.infinity,
                                child: Text(
                                  '${bookingList[index].thanhTien} đ',
                                  style: tStyle.BaseBoldPrimary(),
                                  textAlign: TextAlign.end,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void onTapDetailPayment(index) {
    Navigator.pushNamed(
      context,
      DetailPayment.routeName,
      arguments: DetailPaymentArg(
        nameHotel: bookingList[index].tenKS,
        giaPhong: bookingList[index].giaPhong,
        name: bookingList[index].hoTen,
        email: bookingList[index].email,
        phoneNumber: bookingList[index].sdt,
        startDate: bookingList[index].ngayNhan,
        endDate: bookingList[index].ngayTra,
        people: bookingList[index].soNguoi,
        roomType: bookingList[index].roomType,
        roomTypeNumber: bookingList[index].roomTypeNumber,
        room: bookingList[index].soPhong,
        night: bookingList[index].soDem,
        totalMoney: bookingList[index].thanhTien,
        tenTrangThai: bookingList[index].tenTrangThai,
      ),
    );
  }
}
