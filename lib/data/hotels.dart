import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Hotels {
  String address;
  String locationCode;
  int price;
  String roomType;
  int roomTypeNumber;
  Hotels({
    required this.address,
    required this.locationCode,
    required this.price,
    required this.roomType,
    required this.roomTypeNumber,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'locationCode': locationCode,
      'price': price,
      'roomType': roomType,
      'roomTypeNumber': roomTypeNumber,
    };
  }

  factory Hotels.fromMap(Map<String, dynamic> map) {
    return Hotels(
      address: map['address'] as String,
      locationCode: map['locationCode'] as String,
      price: map['price'] as int,
      roomType: map['roomType'] as String,
      roomTypeNumber: map['roomTypeNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Hotels.fromJson(String source) =>
      Hotels.fromMap(json.decode(source) as Map<String, dynamic>);
}
