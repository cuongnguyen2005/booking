import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:flutter/material.dart';

class TopBarSecondary extends StatelessWidget {
  const TopBarSecondary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                color: AppColors.white,
              ),
              const SizedBox(width: 5),
              Text('20/05/2023', style: tStyle.BaseRegularWhite())
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.brightness_2,
                color: AppColors.white,
              ),
              const SizedBox(width: 5),
              Text('2', style: tStyle.BaseRegularWhite())
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.bed_outlined,
                color: AppColors.white,
              ),
              const SizedBox(width: 5),
              Text('2', style: tStyle.BaseRegularWhite())
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                color: AppColors.white,
              ),
              const SizedBox(width: 5),
              Text('2', style: tStyle.BaseRegularWhite())
            ],
          ),
        ],
      ),
    );
  }
}
