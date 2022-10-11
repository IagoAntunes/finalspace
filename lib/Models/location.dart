class Location {
  int id;
  String name;
  String type;
  List<dynamic> inhabitants;
  String img;

  Location(
      {required this.id,
      required this.name,
      required this.type,
      required this.inhabitants,
      required this.img});

  factory Location.fromMap(Map<String, dynamic> map) {
    Location location;
    location = Location(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      inhabitants: map['inhabitants'] ?? '',
      img: map['img'],
    );

    return location;
  }
}
