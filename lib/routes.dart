import 'package:booking/feature/book/checkout.dart';
import 'package:booking/feature/book/customer_info.dart';
import 'package:booking/feature/detail.dart';
import 'package:booking/feature/search/search_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  // if (settings.name == SplashScreen.routeName) {
  //   return MaterialPageRoute(builder: (_) => const SplashScreen());
  // }
  // if (settings.name == LoginPage.routeName) {
  //   final arg = settings.arguments as String?;
  //   return MaterialPageRoute(builder: (_) => LoginPage());
  // }
  if (settings.name == DetailPage.routeName) {
    return MaterialPageRoute(builder: (_) => const DetailPage());
  }
  if (settings.name == SearchPage.routeName) {
    final arg = settings.arguments as SearchPageArg;
    return MaterialPageRoute(
        builder: (_) => SearchPage(
              arg: arg,
            ));
  }
  if (settings.name == CustomerInfo.routeName) {
    return MaterialPageRoute(builder: (_) => const CustomerInfo());
  }
  if (settings.name == Checkout.routeName) {
    return MaterialPageRoute(builder: (_) => const Checkout());
  }

  return null;
};
