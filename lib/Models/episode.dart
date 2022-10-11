class Episode {
  int id;
  String name;
  String date;
  String director;
  String writer;
  String img;

  Episode(
      {required this.id,
      required this.name,
      required this.date,
      required this.director,
      required this.writer,
      required this.img});

  factory Episode.fromMap(Map<String, dynamic> map) {
    Episode episode;
    episode = Episode(
      id: map['id'],
      name: map['name'],
      date: map['date'],
      director: map['director'] ?? '',
      writer: map['writer'],
      img: map['img'] ?? ' ',
    );

    return episode;
  }
}
