import 'package:flutter/material.dart';

class BottomNaviAdmin extends StatefulWidget {
  const BottomNaviAdmin({super.key});
  static String routeName = 'bottom_navi_admin';

  @override
  State<BottomNaviAdmin> createState() => _BottomNaviAdminState();
}

class _BottomNaviAdminState extends State<BottomNaviAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Trang admin'),
    );
  }
}
