import 'dart:convert';
import 'package:flutter/services.dart';


class Kata {
  String kata;
 
  Kata({this.kata});
 
 factory Kata.fromJson(Map<String, dynamic> parsedJson) {
    return Kata(
      kata: parsedJson["kata"] as String

    );
  }
}


// class KamusViewModel {
// List<Kata> kata2;

//  Future loadKamus() async {
//     String jsonString = await rootBundle.loadString('assets/kamus.json');
//     Map parsedJson = json.decode(jsonString);
//     var kata2Json = parsedJson['kata'] as List;
//     for (int i = 0; i < kata2Json.length; i++){
//       kata2.add(new Kata.fromJson(kata2Json[i]));
//     }
//   }
// }


