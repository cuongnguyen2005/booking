// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:booking/source/typo.dart';

class NoResult extends StatelessWidget {
  const NoResult({
    Key? key,
    required this.text,
    required this.text2,
  }) : super(key: key);
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Image.asset('assets/images/no_result.png'),
          Text(text, style: tStyle.MediumBoldBlack()),
          const SizedBox(height: 5),
          Text(text2,
              style: tStyle.BaseRegularBlack()),
        ],
      ),
    );
  }
}
