// import 'dart:convert';
// import 'package:flutter/services.dart';



// class Kamus {
//   String kata;
 
//   Kamus({this.kata});
 
//   factory Kamus.fromJson(Map<String, dynamic> parsedJson) {
//     return Kamus(
//       kata: parsedJson["kata"] as String,
//     );
//   }
// }

// class KamusViewModel {
//   static List<Kamus> kata2;

//   static Future loadKamus() async {
//     String jsonString = await rootBundle.loadString('assets/kamus.json');
//     Map parsedJson = json.decode(jsonString);
//     var kata2Json = parsedJson['kata'] as List;
//     for (int i = 0; i < kata2Json.length; i++){
//       kata2.add(new Kamus.fromJson(kata2Json[i]));
//     }
//   }
// }

// void _loadData() async {
//   await PlayersViewModel.loadPlayers();
// }

// @override
// void initState() {
//   _loadData();
// }

class Kamus {
  final String lud;
  final String ind;
  final String kalimat_lud;
  final String kalimat_ind;

  Kamus({this.lud, this.ind, this.kalimat_lud, this.kalimat_ind});



//       static List<Kamus> getSuggestions(String query) {
//     List<Kamus> list = List<Kamus>();
//     list.addAll(lud);

//     matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
//     return matches;
//   }
// }

    // static List<Kamus> loadKamus(String jsonString) {
    // List<Kamus> list = new List<Kamus>();
    // list.add(Kamus(lud: 'tes'));
    // list.add(Kamus(lud: 'teat'));
    // return list;
    // }

  factory Kamus.fromJson(Map <String, dynamic> json){
    return new Kamus(
       lud: json['lud'] as String,
       ind: json['ind'] as String,
       kalimat_lud: json['kalimat_lud'] as String,
       kalimat_ind: json['kalimat_ind'] as String,
    );
  }
  
}