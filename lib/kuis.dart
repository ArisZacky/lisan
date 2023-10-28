import 'package:flutter/material.dart';
import 'contoh.dart';
import 'tambah.dart';
import 'bank.dart';
import 'kamus.dart';


class KuisPage extends StatefulWidget {
  static String tag = 'kuis-page';
  @override
  _KuisPageState createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {

    Future<String>createAlertDialog(BuildContext context){
  

    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Jawaban Anda Tepat Sekali/Yah Jawaban Anda Salah"),
        content: Text("Jawaban yang benar adalah 'Contoh Kalimat Jawabannya'"),
        actions: <Widget>[
          MaterialButton(
            elevation: 5,
            child: Text("OK"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    });
  }







  @override
  Widget build(BuildContext context) {
    final judul = 
      Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text("Kuis", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w300),),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text("Lisan u Dawat", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text("Jawablah Kuis Kalimat ini", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text('"Contoh Kalimat"', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
      ],
    );

    final cari =
    Column(
      children: <Widget>[
          Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Tulis Jawaban Anda Disni...",
                  contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                ),
              ),
            ),
            MaterialButton(
              height: 35,
              onPressed: (){
                createAlertDialog(context);
              },
              color: Colors.blue,
              child: Text("Jawab", style: TextStyle(color: Colors.white),),
            )
          ],
        ),
        Text("Jawaban yang benar akan muncul setelah anda menjawab pertanyaan diatas", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.amber[800], fontWeight: FontWeight.w600),)
      ],
    );



    return Scaffold(
      appBar: AppBar(title: Text("E-Learning Lisan u Dawat"), backgroundColor: Colors.green[800],),
      drawer:Theme(
    	data: Theme.of(context).copyWith(
		  canvasColor: Colors.green[800]
	    ),
	    child: new Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Kamus", style: TextStyle(color: Colors.white70),),
              onTap: (){
                Navigator.of(context).pushNamed(KamusPage.tag);
              },
            ),
            // ListTile(
            //   title: Text("Contoh Kalimat", style: TextStyle(color: Colors.white70),),
            //   onTap: (){
            //     Navigator.of(context).pushNamed(ContohKalimat.tag);
            //   },
            // ),
            // ListTile(
            //   title: Text("Tambah Kata", style: TextStyle(color: Colors.white70),),
            //   onTap: (){
            //     Navigator.of(context).pushNamed(TambahKata.tag);
            //   },
            // ),
            // ListTile(
            //   title: Text("Bank Kata", style: TextStyle(color: Colors.white70),),
            //   onTap: (){
            //     Navigator.of(context).pushNamed(BankKata.tag);
            //   },
            // ),
          ],
        ),
      ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24, right:24),
          children: <Widget>[
            judul, SizedBox(),         
            cari  
          ],
        )
        ,),
      bottomNavigationBar:
      Container(
        height: 30,
        child: BottomAppBar(
          child:         
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("Dev Team @z4comp - @erzap", textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 14,),),
            ),
          ),
          color: Colors.green[800],
        ),
      ),
    );
  }
}