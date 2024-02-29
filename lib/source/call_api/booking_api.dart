import 'package:booking/data/booking.dart';
import 'package:booking/data/favorite_hotel.dart';
import 'package:booking/data/hotels.dart';
import 'package:booking/data/notification.dart';
import 'package:booking/data/rooms.dart';
import 'package:dio/dio.dart';

class BookingRepo {
  //lấy dữ liệu khách sạn
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

  //lấy dữ liệu phong
  static Future<List<Rooms>> getRooms() async {
    final dio = Dio();
    final Response response = await dio
        .get('https://booking-9cf26-default-rtdb.firebaseio.com/Rooms.json');
    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<Rooms> roomslList =
          json.values.map((e) => Rooms.fromMap(e)).toList();
      return roomslList;
    } else {
      return [];
    }
  }

  //save booking
  static Future<List<Booking>> bookingHotel(
    DateTime ngayNhan,
    DateTime ngayTra,
    int soDem,
    int soLuongNguoi,
    int soLuongPhong,
    int thanhTien,
    String hoTen,
    String email,
    String sdt,
    int dienTichPhong,
    String tenPhong,
    int giaPhong,
    String loaiGiuong,
    String maKS,
    String tenKS,
    String idKhachHang,
  ) async {
    final dio = Dio();
    String url =
        'https://booking-9cf26-default-rtdb.firebaseio.com/TotalBookingHotel.json';
    Booking bookingHotel = Booking(
      idDatPhong: '',
      ngayNhan: ngayNhan,
      ngayTra: ngayTra,
      soDem: soDem,
      soLuongNguoi: soLuongNguoi,
      soLuongPhong: soLuongPhong,
      thanhTien: thanhTien,
      hoTen: hoTen,
      email: email,
      sdt: sdt,
      dienTichPhong: dienTichPhong,
      tenPhong: tenPhong,
      giaPhong: giaPhong,
      loaiGiuong: loaiGiuong,
      maKS: maKS,
      tenKS: tenKS,
      idKhachHang: idKhachHang,
      trangThai: 2,
    );
    final Response response = await dio.post(url, data: bookingHotel.toMap());
    if (response.data != null) {
      String id = response.data['name'];
      String url1 =
          'https://booking-9cf26-default-rtdb.firebaseio.com/TotalBookingHotel/$id.json';
      await dio.patch(url1, data: {'idDatPhong': id});
    }
    return [];
  }

  //get booking by User
  static Future<List<Booking>> getBookingByUser() async {
    final dio = Dio();
    final Response response = await dio.get(
        'https://booking-9cf26-default-rtdb.firebaseio.com/TotalBookingHotel.json');

    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<Booking> bookingList =
          json.values.map((e) => Booking.fromMap(e)).toList();
      return bookingList;
    } else {
      return [];
    }
  }

  //save favorite hotel by user
  static Future<List<FavoriteHotel>> saveFavoriteHotel(
    String uid,
    String idKS,
    String tenKS,
    String anhKS,
    int gia,
    String diaChi,
  ) async {
    final dio = Dio();
    String url =
        'https://booking-9cf26-default-rtdb.firebaseio.com/FavoriteHotelByUser/$uid.json';
    FavoriteHotel favoriteHotel = FavoriteHotel(
      id: '',
      idKS: idKS,
      tenKS: tenKS,
      anhKS: anhKS,
      giaKS: gia,
      diaChi: diaChi,
    );
    final Response response = await dio.post(url, data: favoriteHotel.toMap());
    if (response.data != null) {
      String id = response.data['name'];
      String url1 =
          'https://booking-9cf26-default-rtdb.firebaseio.com/FavoriteHotelByUser/$uid/$id.json';
      await dio.patch(url1, data: {'id': id});
    }
    return [];
  }

  //get favorite hotel by user
  static Future<List<FavoriteHotel>> getFavoriteHotelByUser(String uid) async {
    final dio = Dio();
    final Response response = await dio.get(
        'https://booking-9cf26-default-rtdb.firebaseio.com/FavoriteHotelByUser/$uid.json');

    if (response.data != null) {
      Map<String, dynamic> json = response.data;
      final List<FavoriteHotel> favoriteHotel =
          json.values.map((e) => FavoriteHotel.fromMap(e)).toList();
      return favoriteHotel;
    } else {
      return [];
    }
  }

  //save notification
  static Future<List<NotificationClass>> saveNotification(
    String tenKS,
    DateTime dateTime,
    DateTime dateCheckIn,
    String maCty,
  ) async {
    final dio = Dio();
    String url =
        'https://booking-9cf26-default-rtdb.firebaseio.com/Notifications.json';
    NotificationClass notification = NotificationClass(
      idNoti: '',
      tenKS: tenKS,
      dateTime: dateTime,
      dateCheckIn: dateCheckIn,
      maCty: maCty,
    );
    await dio.post(url, data: notification.toMap());
    return [];
  }
}
