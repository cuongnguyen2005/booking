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
    return MaterialPageRoute(builder: (_) => const SearchPage());
  }

  return null;
};
