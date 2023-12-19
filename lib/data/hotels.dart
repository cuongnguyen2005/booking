import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Hotels {
  String idKS;
  String tenKS;
  String diaChi;
  String thanhPho;
  String maDiaDiem;
  int gia;
  String anhKS;
  String roomType;
  int roomTypeNumber;
  String congTy;
  String maCongTy;
  String maNV;
  Hotels({
    required this.idKS,
    required this.tenKS,
    required this.diaChi,
    required this.thanhPho,
    required this.maDiaDiem,
    required this.gia,
    required this.anhKS,
    required this.roomType,
    required this.roomTypeNumber,
    required this.congTy,
    required this.maCongTy,
    required this.maNV,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idKS': idKS,
      'tenKS': tenKS,
      'diaChi': diaChi,
      'thanhPho': thanhPho,
      'maDiaDiem': maDiaDiem,
      'gia': gia,
      'anhKS': anhKS,
      'roomType': roomType,
      'roomTypeNumber': roomTypeNumber,
      'congTy': congTy,
      'maCongTy': maCongTy,
      'maNV': maNV,
    };
  }

  factory Hotels.fromMap(Map<String, dynamic> map) {
    return Hotels(
      idKS: map['idKS'] as String,
      tenKS: map['tenKS'] as String,
      diaChi: map['diaChi'] as String,
      thanhPho: map['thanhPho'] as String,
      maDiaDiem: map['maDiaDiem'] as String,
      gia: map['gia'] as int,
      anhKS: map['anhKS'] as String,
      roomType: map['roomType'] as String,
      roomTypeNumber: map['roomTypeNumber'] as int,
      congTy: map['congTy'] as String,
      maCongTy: map['maCongTy'] as String,
      maNV: map['maNV'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotels.fromJson(String source) =>
      Hotels.fromMap(json.decode(source) as Map<String, dynamic>);
}
