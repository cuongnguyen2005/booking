// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

class TopBarSecondary extends StatelessWidget {
  const TopBarSecondary({
    Key? key,
    required this.startTime,
    required this.night,
    required this.people,
    required this.room,
    this.onTapSelectDay,
    this.onTapSelectPeople,
  }) : super(key: key);
  final DateTime startTime;
  final int night;
  final int people;
  final int room;
  final void Function()? onTapSelectDay;
  final void Function()? onTapSelectPeople;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTapSelectDay,
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.white,
                ),
                const SizedBox(width: 5),
                Text(DateFormat.yMd().format(startTime),
                    style: tStyle.BaseRegularWhite())
              ],
            ),
          ),
          InkWell(
            onTap: onTapSelectDay,
            child: Row(
              children: [
                const Icon(
                  Icons.brightness_2,
                  color: AppColors.white,
                ),
                const SizedBox(width: 5),
                Text('$night', style: tStyle.BaseRegularWhite())
              ],
            ),
          ),
          InkWell(
            onTap: onTapSelectPeople,
            child: Row(
              children: [
                const Icon(
                  Icons.door_back_door,
                  color: AppColors.white,
                ),
                const SizedBox(width: 5),
                Text('$room', style: tStyle.BaseRegularWhite())
              ],
            ),
          ),
          InkWell(
            onTap: onTapSelectPeople,
            child: Row(
              children: [
                const Icon(
                  Icons.person_outline,
                  color: AppColors.white,
                ),
                const SizedBox(width: 5),
                Text('$people', style: tStyle.BaseRegularWhite())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
