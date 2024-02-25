import 'dart:convert';
import 'package:booking/components/box/setting_box_primary.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/components/btn/button_secondary.dart';
import 'package:booking/components/top_bar/topbar_third.dart';
import 'package:booking/data/user_account.dart';
import 'package:booking/feature/login/login.dart';
import 'package:booking/feature/setting/person_info.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    checkUserExist();
    getInfo();
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserAccount? usersAccount;
  void checkUserExist() {
    if (user != null) {
      setState(() {
        checkUser = true;
      });
    }
  }

  void getInfo() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get()
        .then((value) {
      setState(() {
        usersAccount = UserAccount.fromMap(value.data());
      });
    });
  }

  bool checkUser = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const TopBarThird(text: 'Cài đặt'),
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                if (checkUser == false)
                  Container(
                    color: AppColors.primary,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          'Đăng ký thành viên, hưởng nhiều ưu đãi',
                          style: tStyle.BaseRegularWhite(),
                        ),
                        const SizedBox(height: 16),
                        ButtonSecondary(
                          text: 'Đăng nhập, đăng ký',
                          onTap: onTapLogin,
                        )
                      ],
                    ),
                  ),
                if (checkUser == true)
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: AppColors.primary,
                            ),
                            height: size.height * 0.18,
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    (usersAccount?.avatar ?? '').isEmpty
                                        ? CircleAvatar(
                                            radius: 35,
                                            backgroundColor: AppColors.green
                                                .withOpacity(0.5),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(35),
                                            child: Image.network(
                                              usersAccount?.avatar ?? '',
                                              height: 70,
                                              width: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                    const SizedBox(width: 16),
                                    Text(usersAccount?.hoTen ?? '',
                                        style: tStyle.MediumBoldBlack()),
                                  ],
                                ),
                                const SizedBox(height: 24),
                                ButtonPrimary(
                                  text: 'Xem thông tin tài khoản',
                                  onTap: onTapShowInfoUser,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                SettingBoxPrimary(
                  icon1: Icons.money,
                  title: 'Hoàn tiền',
                  onTap: () {},
                ),
                SettingBoxPrimary(
                  icon1: Icons.wallet,
                  title: 'Thẻ của tôi',
                  onTap: () {},
                ),
                SettingBoxPrimary(
                  icon1: Icons.money,
                  title: 'Chủ đề',
                  onTap: () {},
                ),
                SettingBoxPrimary(
                  icon1: Icons.money,
                  title: 'Ngôn ngữ',
                  onTap: () {},
                ),
                SettingBoxPrimary(
                  icon1: Icons.question_answer,
                  title: 'Trung tâm hỗ trợ',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onTapLogin() {
    Navigator.pushNamed(context, LoginPage.routeName);
  }

  void onTapShowInfoUser() {
    Navigator.pushNamed(context, PersonInfo.routeName,arguments: usersAccount).then((value) => getInfo());
  }
}
