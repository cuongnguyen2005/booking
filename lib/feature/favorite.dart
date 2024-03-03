import 'package:booking/components/dialog/no_results.dart';
import 'package:booking/components/top_bar/topbar_third.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarThird(text: 'Mục đã lưu'),
          Flexible(
            child: NoResult(text: 'Bạn chưa có khách sạn lưu trữ', text2: ''),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
