class Character {
  String id;
  String? name;
  String? status;
  String? species;
  String? gender;
  String? hair;
  String? origin;
  String? img;
  List<dynamic> abilities;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.hair,
    required this.origin,
    required this.img,
    required this.abilities,
  });

  factory Character.fromMap(Map<String, dynamic> map) {
    Character character;
    character = Character(
      id: map['id'].toString(),
      name: map['name'],
      status: map['status'],
      species: map['species'] ?? '',
      gender: map['gender'],
      hair: map['hair'],
      origin: map['origin'],
      img: map['img'],
      abilities: map['abilities'],
    );

    return character;
  }
}
