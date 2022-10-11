import 'dart:convert';

import 'package:finalspace/Models/character.dart';
import 'package:finalspace/Models/quotes.dart';
import 'package:http/http.dart' as http;

class General {
  static getCharacters() async {
    final response = await http.get(
      Uri.parse('https://finalspaceapi.com/api/v0/character/'),
    );
    List<dynamic> dataList = [];
    List<Character> listaCharacters = [];
    if (response.statusCode == 200) {
      dataList = jsonDecode(response.body);
      for (var data in dataList) {
        final map = {
          'id': data['id'],
          'name': data['name'],
          'status': data['status'],
          'species': data['species'],
          'gender': data['gender'],
          'hair': data['hair'],
          'origin': data['origin'],
          'img': data['img_url'],
          'abilities': data['abilities'],
        };
        listaCharacters.add(Character.fromMap(map));
      }
    }
    return listaCharacters;
  }

  static getQuotes() async {
    final response = await http.get(
      Uri.parse('https://finalspaceapi.com/api/v0/quote/'),
    );
    List<Quotes> listaQuotes = [];

    if (response.statusCode == 200) {
      List<dynamic> dataQuotes = jsonDecode(response.body);
      for (var data in dataQuotes) {
        final map = {
          'id': data['id'],
          'quote': data['quote'],
          'by': data['by'],
          'character': data['character'],
          'image': data['image'],
        };
        listaQuotes.add(Quotes.fromMap(map));
      }
    }
    return listaQuotes;
  }
}
