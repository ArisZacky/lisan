import 'package:flutter/material.dart';
import 'kamus.dart';
import 'tambah.dart';
import 'bank.dart';

class ContohKalimat extends StatefulWidget {
  static String tag = 'contoh-page';

  @override
  _ContohKalimatState createState() => _ContohKalimatState();
}

class _ContohKalimatState extends State<ContohKalimat> {
  @override
  Widget build(BuildContext context) {
    final judul = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text("Contoh Kalimat", style: TextStyle(fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),),
        ),
Row(
          children: <Widget>[
            Container(
              width: 140,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 30),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("Total Kata: 1398",textAlign: TextAlign.center,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white,)),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.fromLTRB(15, 0, 0, 30),
              decoration: BoxDecoration(
                color: Colors.yellowAccent[700],
                borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("Missing Translation: 784", textAlign: TextAlign.center ,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black,)),
              ),
            ),
          ],
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
                  hintText: "Cari disini aja kalimat yang lain...",
                  contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                ),
              ),
            ),
            MaterialButton(
              height: 35,
              onPressed: (){

              },
              color: Colors.blue,
              child: Text("Cari", style: TextStyle(color: Colors.white),),
            )
          ],
        ),
        Text('Kalian dapat mencari contoh-contoh kalimat disini, caranya masukkan kata yang ingin kalian cari contoh kalimatnya, misal "Imam Husain" lalu tekan Enter, maka apps ini akan menampilkan contoh kalimat yang berkaitan dengan kata tersebut', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),)
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
            ListTile(
              title: Text("Contoh Kalimat", style: TextStyle(color: Colors.white70),),
              onTap: (){
                Navigator.of(context).pushNamed(ContohKalimat.tag);
              },
            ),
            ListTile(
              title: Text("Tambah Kata", style: TextStyle(color: Colors.white70),),
              onTap: (){
                Navigator.of(context).pushNamed(TambahKata.tag);             
                },
            ),
            ListTile(
              title: Text("Bank Kata", style: TextStyle(color: Colors.white70),),
              onTap: (){
                Navigator.of(context).pushNamed(BankKata.tag);
              },
            ),
          ],
        ),
      ),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24, right:24),
          children: <Widget>[
           judul, SizedBox(),
           cari,            
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
              child: Text("Dev Team @z4comp - @erzap", textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontSize: 15.5,),),
            ),
          ),
          color: Colors.green[800],
        ),
      ),
    );
  }
}