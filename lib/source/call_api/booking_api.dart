import 'package:booking/data/booking.dart';
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

  //booking by User
  static Future<List<Booking>> bookingHotelByUser(
    String uid,
    String hoTen,
    String email,
    String sdt,
    DateTime ngayNhan,
    DateTime ngayTra,
    int soDem,
    int soNguoi,
    int soPhong,
    int thanhTien,
    String idKS,
    String tenKS,
    int giaPhong,
    String roomType,
    int roomTypeNumber,
    String congTy,
    String maCongTy,
  ) async {
    final dio = Dio();
    String url =
        'https://booking-9cf26-default-rtdb.firebaseio.com/BookingHotelByUser/$uid.json';
    Booking bookingHotel = Booking(
      hoTen: hoTen,
      email: email,
      sdt: sdt,
      ngayNhan: ngayNhan,
      ngayTra: ngayTra,
      soDem: soDem,
      soNguoi: soNguoi,
      soPhong: soPhong,
      thanhTien: thanhTien,
      idKS: idKS,
      tenKS: tenKS,
      giaPhong: giaPhong,
      roomType: roomType,
      roomTypeNumber: roomTypeNumber,
      congTy: congTy,
      maCongTy: maCongTy,
      trangThai: 2, // 2: chờ xử lý, 1: từ chối, 0: hoàn thành
      tenTrangThai: 'Đang xử lý',
    );
    final Response response = await dio.post(url, data: bookingHotel.toMap());
    return [];
  }

  //booking
  static Future<List<Booking>> bookingHotel(
    String hoTen,
    String email,
    String sdt,
    DateTime ngayNhan,
    DateTime ngayTra,
    int soDem,
    int soNguoi,
    int soPhong,
    int thanhTien,
    String idKS,
    String tenKS,
    int giaPhong,
    String roomType,
    int roomTypeNumber,
    String congTy,
    String maCongTy,
  ) async {
    final dio = Dio();
    String url =
        'https://booking-9cf26-default-rtdb.firebaseio.com/TotalBookingHotel.json';
    Booking bookingHotel = Booking(
      idBooking: '',
      hoTen: hoTen,
      email: email,
      sdt: sdt,
      ngayNhan: ngayNhan,
      ngayTra: ngayTra,
      soDem: soDem,
      soNguoi: soNguoi,
      soPhong: soPhong,
      thanhTien: thanhTien,
      idKS: idKS,
      tenKS: tenKS,
      giaPhong: giaPhong,
      roomType: roomType,
      roomTypeNumber: roomTypeNumber,
      congTy: congTy,
      maCongTy: maCongTy,
      trangThai: 2,
      tenTrangThai: 'Đang xử lý',
    );
    final Response response = await dio.post(url, data: bookingHotel.toMap());
    if (response.data != null) {
      String id = response.data['name'];
      String url1 =
          'https://booking-9cf26-default-rtdb.firebaseio.com/TotalBookingHotel/$id.json';
      await dio.patch(url1, data: {'idBooking': id});
    }
    return [];
  }

  //get booking by User
  static Future<List<Booking>> getBookingByUser(String uid) async {
    final dio = Dio();
    final Response response = await dio.get(
        'https://booking-9cf26-default-rtdb.firebaseio.com/BookingHotelByUser/$uid.json');

    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<Booking> bookingList =
          json.values.map((e) => Booking.fromMap(e)).toList();
      return bookingList;
    } else {
      return [];
    }
  }
}
