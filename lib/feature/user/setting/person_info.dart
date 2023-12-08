import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/feature/user/bottom_navi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PersonInfo extends StatefulWidget {
  const PersonInfo({super.key});
  static String routeName = 'person_info';

  @override
  State<PersonInfo> createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ButtonPrimary(
            text: 'Đăng xuất',
            onTap: Logout,
          ),
        ],
      ),
    );
  }

  void Logout() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, BottomNavi.routeName, (route) => false);
  }
}
