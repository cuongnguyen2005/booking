// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:booking/components/box/setting_box_secondary.dart';
import 'package:booking/components/btn/button_primary.dart';
import 'package:booking/components/text_field/text_field_default.dart';
import 'package:booking/components/top_bar/topbar_default.dart';
import 'package:booking/data/user_account.dart';
import 'package:booking/feature/bottom_navi.dart';
import 'package:booking/source/colors.dart';

class PersonInfo extends StatefulWidget {
  const PersonInfo({
    Key? key,
    required this.userAccount,
  }) : super(key: key);
  final UserAccount userAccount;
  static String routeName = 'person_info';

  @override
  State<PersonInfo> createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  @override
  void initState() {
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;

  String imageUrl = '';

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      String fileName = user!.uid;
      if (pickedFile == null) {
        return;
      }
      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirectImage = referenceRoot.child('users');
      Reference referenceUpload = referenceDirectImage.child(fileName);
      try {
        await referenceUpload.putFile(File(pickedFile.path));
        imageUrl = await referenceUpload.getDownloadURL();
      } catch (e) {
        //some error
      }
      UserAccount userAcc = UserAccount(
        hoTen: widget.userAccount.hoTen,
        gioiTinh: widget.userAccount.gioiTinh,
        diaChi: widget.userAccount.diaChi,
        avatar: imageUrl,
        email: widget.userAccount.email,
        sdt: widget.userAccount.sdt,
      );
      //save to firestore
      addtoServer(userAcc);
      //get user from firestore and update image on client
      UserAccount? userAccFromDB;
      FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .get()
          .then((value) {
        setState(() {
          userAccFromDB = UserAccount.fromMap(value.data());
        });
        if (userAccFromDB?.avatar == imageUrl) {
          setState(() {
            widget.userAccount.avatar = userAccFromDB!.avatar;
          });
        } else {}
      });
    } catch (e) {
      //some error
    }
  }

  void addtoServer(UserAccount userAcc) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .update(userAcc.toMap());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          TopBarDefault(
            text: 'Thông tin tài khoản',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(16),
                      child: (widget.userAccount.avatar).isEmpty
                          ? CircleAvatar(
                              radius: 75,
                              backgroundColor: AppColors.green.withOpacity(0.5),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(75),
                              child: Image.network(
                                widget.userAccount.avatar,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 5,
                      left: size.width * .465,
                      child: InkWell(
                        onTap: () {
                          pickImage();
                        },
                        child: const CircleAvatar(
                          backgroundColor: AppColors.green,
                          radius: 15,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SettingBoxSecondary(
                  icon1: Icons.email,
                  title: 'Địa chỉ email',
                  text: widget.userAccount.email,
                  onTap: () {},
                ),
                SettingBoxSecondary(
                  icon1: Icons.person,
                  title: 'Tên',
                  text: widget.userAccount.hoTen,
                  onTap: onTapChangeName,
                ),
                SettingBoxSecondary(
                  icon1: Icons.lock,
                  title: 'Mật khẩu',
                  text: 'Thay đổi mật khẩu',
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ButtonPrimary(
                    text: 'Đăng xuất',
                    onTap: logOut,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void logOut() {
    FirebaseAuth.instance.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, BottomNavi.routeName, (route) => false);
  }

  void onTapChangeName() {
    final nameController = TextEditingController()
      ..text = widget.userAccount.hoTen;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: InputDefault(
            hintText: 'Họ tên',
            obscureText: false,
            controller: nameController,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: ButtonPrimary(
                text: 'Cập nhật',
                onTap: () {
                  UserAccount userAcc = UserAccount(
                    hoTen: nameController.text,
                    gioiTinh: widget.userAccount.gioiTinh,
                    diaChi: widget.userAccount.diaChi,
                    avatar: widget.userAccount.avatar,
                    email: widget.userAccount.email,
                    sdt: widget.userAccount.sdt,
                  );
                  addtoServer(userAcc);
                  UserAccount? userAccDt;
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(user?.uid)
                      .get()
                      .then((value) {
                    setState(() {
                      userAccDt = UserAccount.fromMap(value.data());
                    });
                    if (userAccDt?.hoTen == nameController.text) {
                      setState(() {
                        widget.userAccount.hoTen = userAccDt?.hoTen ?? '';
                      });
                    } else {}
                  });
                  onTapBack();
                },
              ),
            )
          ],
        );
      },
    );
  }

  void onTapBack() {
    Navigator.pop(context);
  }
}
