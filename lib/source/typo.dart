// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:booking/source/colors.dart';
import 'package:flutter/material.dart';

const tStyle = TextStyle();

extension TextStyle$ on TextStyle {
  //Headline
  TextStyle H1Bold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 64,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H1SemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 64,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H1Medium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 64,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H1Regular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 64,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H2Bold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 48,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H2SemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 48,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H2Medium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 48,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H2Regular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H3Bold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H3SemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H3Medium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 40,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H3Regular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H4Bold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H4SemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H4Medium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H4Regular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H5Bold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H5SemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H5Medium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H5Regular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H6Bold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H6SemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H6Medium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle H6Regular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );

  //Body
  TextStyle LargeBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle LargeSemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle LargeMedium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle LargeRegular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle MediumBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle MediumSemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle MediumMedium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle MediumRegular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle SmallBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle SmallSemiBold() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle SmallMedium() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
  TextStyle SmallRegular() => copyWith(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
      );
}
