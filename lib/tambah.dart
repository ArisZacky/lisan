import 'package:flutter/material.dart';
import 'kamus.dart';
import 'contoh.dart';
import 'bank.dart';

class TambahKata extends StatefulWidget {
  static String tag = 'tambah-page';

  @override
  _TambahKataState createState() => _TambahKataState();
}

class _TambahKataState extends State<TambahKata> {

  bool isi = false;
  @override
  Widget build(BuildContext context) {

      final judul = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text("Tambah Kata", style: TextStyle(fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),),
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
        ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text("Kata", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          ),
        Container(
          child: TextFormField(
             keyboardType: TextInputType.text,
             autofocus: false,
             decoration: InputDecoration(
               hintText: "Masukkan Kata dalam Lisan u Duwat",
               contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
               border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
           ),
            ),
        ),
        Container(
          alignment: Alignment.topLeft,
          child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
          child: Text("Maksimum satu kata", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16,)),
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text("Arti Kata", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          ),
        Container(
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: "Masukkan Arti Kata dalam Bahasa",
              contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
          ),
            ),
        ),
        Container(
          child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
          child: Text('Arti Kata dapat ditulis lebih dari satu dengan dipisah tanda Koma ","', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16,)),
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text("Topik", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
          ),
          ),
        Container(
          child: TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: InputDecoration(
              hintText: "Masukkan topik dalam Bahasa",
              contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
          ),
            ),
        ),
        Container(
          child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
          child: Text('Topik dapat ditulis lebih dari satu dengan dipisahkan tanda Koma "," Contoh Kesehatan, Bisnis, Lingkungan, Dapur', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16,)),
          ),
        )
              ],
            )
          ],
        );

        final detail = Container(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(7, 30, 0, 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: 
                    isi==false?
                    Text("Berikan Contoh Kalimat?", style: TextStyle(color: Colors.blue, fontSize: 18),)
                    :Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text("Contoh Kalimat dalam Lisan u Dawat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                          ),
                        ),
                        Container(
                          child: TextField(
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                          ),
                        ),
                      ),
                      Container(
                      child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Text('Berikan contoh kalimat untuk mempermudah pembaca dalam menggunakan kata', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16,)),
                      ),
                      ),

                      Container(
                          alignment: Alignment.topLeft,
                          child: Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text("Arti Kalimat", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                          ),
                        ),
                        Container(
                          child: TextField(
                            maxLines: 3,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                          ),
                        ),
                      ),
                      Container(
                      child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: Text('Berikan arti dan Contoh Kalimat diatas dalam Bahasa', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16,)),
                      ),
                      ),
                    ],
                  ),
                  

                  ),
                ),
                onTap: (){                  
                  setState(() {
                   isi=true;
                  });
                },
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(7, 30, 0, 30),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: MaterialButton(
                    height: 50,
            shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
            ),
                  onPressed: (){

                  },
                  color: Colors.blue[600],
                  child: Text("Simpan", style: TextStyle(fontSize: 15, color: Colors.white),),
            ),
                ),
              ),
            ],
          ),
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
           cari, SizedBox(),
           detail, SizedBox()
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