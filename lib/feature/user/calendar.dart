import 'package:booking/components/top_bar/topbar_third.dart';
import 'package:booking/feature/user/detail_payment.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
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
                today = focusedDay;
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
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '01/2022',
                        style: tStyle.MediumBoldBlack(),
                      ),
                      const SizedBox(height: 12),
                      InkWell(
                        onTap: onTapDetailPayment,
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
                                child: Text('Đang xử lý',
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
                                    Text('Khách sạn AB',
                                        style: tStyle.BaseBoldBlack()),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 12),
                                width: double.infinity,
                                child: Text(
                                  '2.000.000 đ',
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

  void onTapDetailPayment() {
    Navigator.pushNamed(context, DetailPayment.routeName);
  }
}
