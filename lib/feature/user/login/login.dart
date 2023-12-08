import 'package:booking/components/btn/button_outline.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/components/text_field/text_field_default.dart';
import 'package:booking/components/top_bar/topbar_no_background.dart';
import 'package:booking/feature/user/bottom_navi.dart';
import 'package:booking/feature/user/signup/signup.dart';
import 'package:booking/source/colors.dart';
import 'package:booking/source/typo.dart';
import 'package:booking/source/utils/validate_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      onTap: onTapLogin,
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
            Text('Bạn chưa có tài khoản? ', style: tStyle.BaseBoldBlack()),
            InkWell(
                onTap: onTapSignup,
                child: Text('Đăng ký', style: tStyle.BaseBoldPrimary())),
          ],
        ),
      ),
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }

  void onTapSignup() {
    Navigator.pushNamed(context, SignupPage.routeName);
  }

  void onTapBackBottomNavi() {
    Navigator.pushNamedAndRemoveUntil(
        context, BottomNavi.routeName, (route) => false);
  }

  void onTapLogin() async {
    if (formKey.currentState!.validate()) {
      try {
        final UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: usernameController.text, password: pwController.text);
        if (user.user != null) {
          onTapBackBottomNavi();
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);
        if (e.code == 'invalid-credential') {
          print('Tài khoản không tồn tại');
        }
        // if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        //   emit(LoginErrorState());
        // }
        // if (e.code == 'wrong-password') {
        //   emit(LoginErrorPassState());
        // }
        // if (e.code == 'user-not-found') {
        //   emit(LoginErrorUserState());
        // }
      }
    }
  }
}
