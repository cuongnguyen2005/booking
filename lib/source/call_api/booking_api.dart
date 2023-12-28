import 'package:booking/data/hotels.dart';
import 'package:dio/dio.dart';

class BookingRepo {
  static Future<List<Hotels>> getHotels() async {
    final dio = Dio();
    final Response response = await dio
        .get('https://booking-9cf26-default-rtdb.firebaseio.com/Hotels.json');
    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<Hotels> hotelList =
          json.values.map((e) => Hotels.fromMap(e)).toList();
      return hotelList;
    } else {
      return [];
    }
  }

  static Future<List<Hotels>> addHotels(
    String tenKS,
    String diaChi,
    String thanhPho,
    String maDiaDiem,
    int gia,
    String anhKS,
    String roomType,
    int roomTypeNumber,
    String congTy,
    String maCongTy,
    String maNV,
    String moTa,
  ) async {
    final dio = Dio();
    String url =
        'https://booking-9cf26-default-rtdb.firebaseio.com/Hotels.json';
    Hotels hotel = Hotels(
      idKS: '',
      tenKS: tenKS,
      diaChi: diaChi,
      thanhPho: thanhPho,
      maDiaDiem: maDiaDiem,
      gia: gia,
      anhKS: anhKS,
      roomType: roomType,
      roomTypeNumber: roomTypeNumber,
      congTy: congTy,
      maCongTy: maCongTy,
      maNV: maNV,
      moTa: moTa,
    );
    final Response response = await dio.post(url, data: hotel.toMap());
    if (response.data != null) {
      String id = response.data['name'];
      String url1 =
          'https://booking-9cf26-default-rtdb.firebaseio.com/Hotels/$id.json';
      await dio.patch(url1, data: {'idKS': id});
    }
    return [];
  }
}
