import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Booking {
  String? idBooking;
  String hoTen;
  String email;
  String sdt;
  DateTime ngayNhan;
  DateTime ngayTra;
  int soDem;
  int soNguoi;
  int soPhong;
  int thanhTien;
  String idKS;
  String tenKS;
  int giaPhong;
  String roomType;
  int roomTypeNumber;
  String congTy;
  String maCongTy;
  int trangThai;
  String tenTrangThai;
  Booking({
    this.idBooking,
    required this.hoTen,
    required this.email,
    required this.sdt,
    required this.ngayNhan,
    required this.ngayTra,
    required this.soDem,
    required this.soNguoi,
    required this.soPhong,
    required this.thanhTien,
    required this.idKS,
    required this.tenKS,
    required this.giaPhong,
    required this.roomType,
    required this.roomTypeNumber,
    required this.congTy,
    required this.maCongTy,
    required this.trangThai,
    required this.tenTrangThai,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idBooking': idBooking,
      'hoTen': hoTen,
      'email': email,
      'sdt': sdt,
      'ngayNhan': ngayNhan.toIso8601String(),
      'ngayTra': ngayTra.toIso8601String(),
      'soDem': soDem,
      'soNguoi': soNguoi,
      'soPhong': soPhong,
      'thanhTien': thanhTien,
      'idKS': idKS,
      'tenKS': tenKS,
      'giaPhong': giaPhong,
      'roomType': roomType,
      'roomTypeNumber': roomTypeNumber,
      'congTy': congTy,
      'maCongTy': maCongTy,
      'trangThai': trangThai,
      'tenTrangThai': tenTrangThai,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      idBooking: map['idBooking'] as String,
      hoTen: map['hoTen'] as String,
      email: map['email'] as String,
      sdt: map['sdt'] as String,
      ngayNhan: DateTime.parse(map['ngayNhan']),
      ngayTra: DateTime.parse(map['ngayTra']),
      soDem: map['soDem'] as int,
      soNguoi: map['soNguoi'] as int,
      soPhong: map['soPhong'] as int,
      thanhTien: map['thanhTien'] as int,
      idKS: map['idKS'] as String,
      tenKS: map['tenKS'] as String,
      giaPhong: map['giaPhong'] as int,
      roomType: map['roomType'] as String,
      roomTypeNumber: map['roomTypeNumber'] as int,
      congTy: map['congTy'] as String,
      maCongTy: map['maCongTy'] as String,
      trangThai: map['trangThai'] as int,
      tenTrangThai: map['tenTrangThai'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source) as Map<String, dynamic>);
}
