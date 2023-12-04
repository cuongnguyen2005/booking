// ignore_for_file: public_member_api_docs, sort_constructors_first
class Locations {
  String name;
  String locationCode;
  Locations({
    required this.name,
    required this.locationCode,
  });
}

List<Locations> location = [
  Locations(name: 'Hà Nội', locationCode: 'hanoi'),
  Locations(name: 'Đà Nẵng', locationCode: 'danang'),
  Locations(name: 'Nha Trang', locationCode: 'nhatrang'),
  Locations(name: 'Hội An', locationCode: 'hoian'),
  Locations(name: 'Vinh', locationCode: 'vinh'),
  Locations(name: 'Hồ chí Minh', locationCode: 'hochiminh'),
];
