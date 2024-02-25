import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAccount {
  String hoTen;
  String gioiTinh;
  String diaChi;
  String avatar;
  String email;
  String sdt;
  UserAccount({
    required this.hoTen,
    required this.gioiTinh,
    required this.diaChi,
    required this.avatar,
    required this.email,
    required this.sdt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hoTen': hoTen,
      'gioiTinh': gioiTinh,
      'diaChi': diaChi,
      'avatar': avatar,
      'email': email,
      'sdt': sdt,
    };
  }

  factory UserAccount.fromMap(map) {
    return UserAccount(
      hoTen: map['hoTen'] as String,
      gioiTinh: map['gioiTinh'] as String,
      diaChi: map['diaChi'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
      sdt: map['sdt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);
}
