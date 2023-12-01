import 'package:booking/feature/bottom_navi.dart';
import 'package:booking/routes.dart';
import 'package:booking/source/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.lightGrey.withOpacity(1),
        fontFamily: 'Roboto',
      ),
      home: const BottomNavi(),
      // initialRoute: ,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
