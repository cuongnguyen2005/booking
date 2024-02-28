// ignore_for_file: public_member_api_docs, sort_constructors_first


class Reason {
  int id;
  String image;
  Reason({
    required this.id,
    required this.image,
  });
}

List<Reason> reasons = [
  Reason(id: 1, image: 'assets/images/images_2.jpeg'),
  Reason(id: 2, image: 'assets/images/image_3.png'),
  Reason(id: 3, image: 'assets/images/images_1.jpeg'),
];
