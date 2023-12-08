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
}
