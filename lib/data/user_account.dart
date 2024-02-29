import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAccount {
  String hoTen;
  DateTime ngaySinh;
  String diaChi;
  int cmnd;
  String sdt;
  String gioiTinh;
  String avatar;
  String email;

  UserAccount({
    required this.hoTen,
    required this.ngaySinh,
    required this.diaChi,
    required this.cmnd,
    required this.sdt,
    required this.gioiTinh,
    required this.avatar,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hoTen': hoTen,
      'ngaySinh': ngaySinh.toIso8601String(),
      'diaChi': diaChi,
      'cmnd': cmnd,
      'sdt': sdt,
      'gioiTinh': gioiTinh,
      'avatar': avatar,
      'email': email,
    };
  }

  factory UserAccount.fromMap(map) {
    return UserAccount(
      hoTen: map['hoTen'] as String,
      ngaySinh: DateTime.parse(map['ngaySinh']),
      diaChi: map['diaChi'] as String,
      cmnd: map['cmnd'] as int,
      sdt: map['sdt'] as String,
      gioiTinh: map['gioiTinh'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);
}
