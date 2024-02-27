import 'package:booking/data/booking.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/data/user_account.dart';
import 'package:booking/feature/book/bloc/booking_bloc.dart';
import 'package:booking/feature/book/checkout.dart';
import 'package:booking/feature/book/customer_info.dart';
import 'package:booking/feature/book/payment_success.dart';
import 'package:booking/feature/bottom_navi.dart';
import 'package:booking/feature/detail_hotel/bloc/detail_hotel_bloc.dart';
import 'package:booking/feature/detail_hotel/detail_hotel.dart';
import 'package:booking/feature/detail_payment.dart';
import 'package:booking/feature/login/bloc/login_bloc.dart';
import 'package:booking/feature/login/login.dart';
import 'package:booking/feature/room/manage_room.dart';
import 'package:booking/feature/search/bloc/search_bloc.dart';
import 'package:booking/feature/search/search_page.dart';
import 'package:booking/feature/search_by_name.dart';
import 'package:booking/feature/setting/person_info.dart';
import 'package:booking/feature/signup/bloc/signup_bloc.dart';
import 'package:booking/feature/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/room/bloc/room_bloc.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  // if (settings.name == SplashScreen.routeName) {
  //   return MaterialPageRoute(builder: (_) => const SplashScreen());
  // }
  if (settings.name == BottomNavi.routeName) {
    return MaterialPageRoute(builder: (_) => const BottomNavi());
  }
  if (settings.name == LoginPage.routeName) {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => LoginBloc(),
              child: const LoginPage(),
            ));
  }
  if (settings.name == SignupPage.routeName) {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => SignupBloc(),
              child: const SignupPage(),
            ));
  }
  if (settings.name == DetailHotelPage.routeName) {
    final arg = settings.arguments as DetailHotelArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => DetailHotelBloc(),
              child: DetailHotelPage(
                arg: arg,
              ),
            ));
  }
  if (settings.name == SearchPage.routeName) {
    final arg = settings.arguments as SearchPageArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => SearchBloc(),
              child: SearchPage(
                arg: arg,
              ),
            ));
  }
  if (settings.name == CustomerInfo.routeName) {
    final arg = settings.arguments as CustomerInfoArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => BookingBloc(),
              child: CustomerInfo(
                arg: arg,
              ),
            ));
  }
  if (settings.name == Checkout.routeName) {
    final arg = settings.arguments as CheckoutArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => BookingBloc(),
              child: Checkout(
                arg: arg,
              ),
            ));
  }
  if (settings.name == PaymentSuccess.routeName) {
    final arg = settings.arguments as int;
    return MaterialPageRoute(
        builder: (_) => PaymentSuccess(
              totalMoney: arg,
            ));
  }
  if (settings.name == DetailPayment.routeName) {
    final arg = settings.arguments as Booking;
    return MaterialPageRoute(
        builder: (_) => DetailPayment(
              booking: arg,
            ));
  }
  if (settings.name == PersonInfo.routeName) {
    final arg = settings.arguments as UserAccount;
    return MaterialPageRoute(
        builder: (_) => PersonInfo(
              userAccount: arg,
            ));
  }
  if (settings.name == RoomManage.routeName) {
    final arg = settings.arguments as RoomManageArg;
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
              create: (context) => RoomBloc(),
              child: RoomManage(
                arg: arg,
              ),
            ));
  }
  if (settings.name == SearchByName.routeName) {
    return MaterialPageRoute(builder: (_) => const SearchByName());
  }
  return null;
};
