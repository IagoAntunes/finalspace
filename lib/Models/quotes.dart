class Quotes {
  int id;
  String quote;
  String by;
  String character;
  String image;

  Quotes(
      {required this.id,
      required this.quote,
      required this.by,
      required this.character,
      required this.image});

  factory Quotes.fromMap(Map<String, dynamic> map) {
    Quotes quotes;
    quotes = Quotes(
      id: map['id'],
      quote: map['quote'],
      by: map['by'],
      character: map['character'] ?? '',
      image: map['image'],
    );

    return quotes;
  }
}
