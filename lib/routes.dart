import 'package:booking/data/hotels.dart';
import 'package:booking/feature/admin/add_hotel.dart';
import 'package:booking/feature/admin/bottom_admin.dart';
import 'package:booking/feature/user/book/checkout.dart';
import 'package:booking/feature/user/book/customer_info.dart';
import 'package:booking/feature/user/book/payment_success.dart';
import 'package:booking/feature/user/bottom_navi.dart';
import 'package:booking/feature/user/detail_hotel.dart';
import 'package:booking/feature/user/detail_payment.dart';
import 'package:booking/feature/user/login/login.dart';
import 'package:booking/feature/user/search/search_page.dart';
import 'package:booking/feature/user/setting/person_info.dart';
import 'package:booking/feature/user/signup/signup.dart';
import 'package:booking/feature/admin/signup_admin.dart';
import 'package:flutter/material.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  // if (settings.name == SplashScreen.routeName) {
  //   return MaterialPageRoute(builder: (_) => const SplashScreen());
  // }
  // if (settings.name == LoginPage.routeName) {
  //   final arg = settings.arguments as String?;
  //   return MaterialPageRoute(builder: (_) => LoginPage());
  // }
  if (settings.name == BottomNavi.routeName) {
    return MaterialPageRoute(builder: (_) => const BottomNavi());
  }
  if (settings.name == LoginPage.routeName) {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }
  if (settings.name == SignupPage.routeName) {
    return MaterialPageRoute(builder: (_) => const SignupPage());
  }
  if (settings.name == DetailHotelPage.routeName) {
    final arg = settings.arguments as Hotels;
    return MaterialPageRoute(
        builder: (_) => DetailHotelPage(
              hotel: arg,
            ));
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
  if (settings.name == PaymentSuccess.routeName) {
    return MaterialPageRoute(builder: (_) => const PaymentSuccess());
  }
  if (settings.name == DetailPayment.routeName) {
    return MaterialPageRoute(builder: (_) => const DetailPayment());
  }
  if (settings.name == PersonInfo.routeName) {
    return MaterialPageRoute(builder: (_) => const PersonInfo());
  }

  //admin
  if (settings.name == BottomNaviAdmin.routeName) {
    return MaterialPageRoute(builder: (_) => const BottomNaviAdmin());
  }
  if (settings.name == SignupAdminPage.routeName) {
    return MaterialPageRoute(builder: (_) => const SignupAdminPage());
  }
  if (settings.name == AddHotel.routeName) {
    final arg = settings.arguments as Hotels;
    return MaterialPageRoute(
        builder: (_) => AddHotel(
              hotel: arg,
            ));
  }

  return null;
};
