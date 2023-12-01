import 'package:flutter/material.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';

class LocationSmallWidget extends StatelessWidget {
  const LocationSmallWidget({
    Key? key,
    required this.image,
    required this.nameHotel,
    required this.addressHotel,
    required this.price,
    required this.star,
  }) : super(key: key);
  final String image;
  final String nameHotel;
  final String addressHotel;
  final String price;
  final String star;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: MediaQuery.of(context).size.width * 8 / 9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 8 / 9 - 120,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nameHotel, style: tStyle.MediumBoldBlack()),
                const SizedBox(height: 8),
                Text(addressHotel, style: tStyle.SmallRegular()),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(price, style: tStyle.MediumBoldBlack()),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yellow,
                        ),
                        Text(star, style: tStyle.MediumBoldBlack()),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
