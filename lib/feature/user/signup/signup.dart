import 'dart:convert';
import 'dart:typed_data';

import 'package:booking/components/btn/button_outline.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/components/text_field/text_field_default.dart';
import 'package:booking/components/top_bar/topbar_no_background.dart';
import 'package:booking/data/user_account.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:booking/source/utils/validate_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  static String routeName = 'signup_page';

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumbereController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/Herobanner.png',
                    width: double.infinity,
                    height: size.height * 1 / 3,
                    fit: BoxFit.cover,
                  ),
                  Form(
                    key: formKey,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          InputDefault(
                            hintText: 'Nhập tên của bạn',
                            obscureText: false,
                            validator: ValidateUntils.validateName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: nameController,
                          ),
                          const SizedBox(height: 16),
                          InputDefault(
                            hintText: 'Nhập số điện thoại',
                            obscureText: false,
                            validator: ValidateUntils.validateName,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: phoneNumbereController,
                          ),
                          const SizedBox(height: 16),
                          InputDefault(
                            hintText: 'Nhập email',
                            obscureText: false,
                            validator: ValidateUntils.validateEmail,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: usernameController,
                          ),
                          const SizedBox(height: 16),
                          InputDefault(
                            hintText: 'Nhập mật khẩu',
                            obscureText: false,
                            validator: ValidateUntils.validatePassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: pwController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonPrimary(
                      text: 'Tiếp tục',
                      onTap: onTapSignup,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: AppColors.lightGrey,
                            height: 1,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            ' Hoặc đăng nhập/đăng ký với ',
                            style: tStyle.BaseRegularGrey(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: AppColors.lightGrey,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonOutline(
                      text: 'Google',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ButtonOutline(
                      text: 'Facbook',
                      onTap: () {},
                    ),
                  ),
                  Container(height: 60),
                ],
              ),
            ],
          ),
          const TopBarNoBackground(text: '')
        ],
      ),
      bottomSheet: Container(
        height: 50,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bạn đã có tài khoản? ', style: tStyle.BaseBoldBlack()),
            InkWell(
                onTap: onTapBack,
                child: Text('Đăng nhập', style: tStyle.BaseBoldPrimary())),
          ],
        ),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSignup() async {
    if (formKey.currentState!.validate()) {
      try {
        final UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: usernameController.text, password: pwController.text);
        if (user.user?.uid != null) {
          ByteData bytes =
              await rootBundle.load('assets/images/avatar_white.jpg');
          final ByteBuffer buffer = bytes.buffer;
          UserAccount userAccount = UserAccount(
            hoTen: nameController.text,
            gioiTinh: '',
            diaChi: '',
            avatar: base64.encode(Uint8List.view(buffer)),
            email: usernameController.text,
            sdt: phoneNumbereController.text,
            idCongty: '',
            quyenAdmin: 0,
            quyenUser: 1,
          );
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.user!.uid)
              .set(userAccount.toMap());
          onTapBack();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {}
        if (e.code == 'network-request-failed') {}
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
