import 'package:flutter/material.dart';
import 'contoh.dart';
import 'tambah.dart';
import 'bank.dart';
import 'kamus.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class NotifPage extends StatefulWidget {
  static String tag = 'notif-page';
  @override
  _NotifPageState createState() => _NotifPageState();
}

class _NotifPageState extends State<NotifPage> {
  List  data;
  String lud = "";
  String ind = "";
  String kalimat_lud= "";
  String kalimat_ind = "";
  Future<String> getJSONData() async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull("http://lisan.z4comp.com/kamus/notif_word.json"),
        // Only accept JSON response
        headers: {"Accept": "application/json"}
    );
    var konten = json.decode(response.body);
          var id = konten['idtopik'];
      await getData(id);
    setState(() {
      // Get the JSON data
      
      debugPrint('tess' + konten.toString());
      debugPrint("kata" + lud.toString());
      
      lud = konten["lud"];
      ind = konten["ind"];
      kalimat_lud = konten["kalimat_lud"];
      kalimat_ind = konten["kalimat_ind"];

      debugPrint(lud+ind+kalimat_lud+kalimat_ind);


      

      // data = konten['lud']['ind']['kalimat_lud']['kalimat_ind'];
    });

    return "Successfull";
  }

    List  isi;
  Future<String> getData(String id) async {
    var response = await http.get(
        // Encode the url
        Uri.encodeFull("http://lisan.z4comp.com/kamus/word_by_topik.json?idtopik=" + id ),
        // Only accept JSON response
        headers: {"Accept": "application/json"}
    );

    setState(() {
      // Get the JSON data
      var oso = json.decode(response.body);
      isi = oso['list_kata'];
    });

    return "Successfull";
  }

  @override
  void initState() {
    this.getJSONData();
  }

  @override
  Widget build(BuildContext context) {
  final judul =
          Container(
            child: Column(
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 5
                
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                child: Text(lud, style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold, ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(ind, style: TextStyle(fontSize: 25,color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              child: Text(kalimat_lud, style: TextStyle(fontSize: 20, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Text(kalimat_ind, style: TextStyle(fontSize: 20,color: Colors.black)),
            ),
            Container(
                  alignment: Alignment.topLeft,
                  // padding: EdgeInsets.only(bottom: 30),
                  child: Text("Kata yang bersangkutan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
        ],
    ),
          );

    final cari =

    ListView.builder(
      itemCount: isi == null ? 0 : isi.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(7, 30, 0, 10),
            child: Column(
              children: <Widget>[
                
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: <Widget>[
                      Container(
                                      padding: EdgeInsets.all(6),
                                      height: 34,
  
                                      decoration: BoxDecoration(
  
                                      color: Colors.blue,
  
                                      borderRadius: BorderRadius.all(Radius.circular(7))
  
                                      ),
                        
                        child: Text(isi[i]['lud'],  textAlign: TextAlign.center ,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),)),
                  Expanded(
                    
                    
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(isi[i]['ind'],style: TextStyle(fontSize: 15)),
                    )),
                    ],
                  ),
                ),    
                Container(
                    alignment: Alignment.topLeft,
  
                    padding: EdgeInsets.fromLTRB(2, 5, 0, 10),
                  
                  child: Text(isi[i]['kalimat_lud'],style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),)),


                Container(
                              alignment: Alignment.topLeft,

                              padding: EdgeInsets.fromLTRB(2, 0, 0, 10),
  
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.blue, width: 2)
                                )
                              ),              
                  
                  child: Text(isi[i]['kalimat_ind'],style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),)),
              ],
            ),
          ),
        );
      }
    );

    final button = 
    
    Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Text("Penasaran sama kata yang lainnya?"),
            
            RaisedButton(
                  onPressed: () { Navigator.of(context).pushReplacementNamed(KamusPage.tag); },
                      color: Colors.blue,
                      padding: const EdgeInsets.all(8),
                      textColor: Colors.white,
                      child: Text("Yuk Cari Disini"),
                      
                ),
          ],
        ),
      ),
    );



    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // actions: <Widget>[
        //   Icon(Icons.home),
        // ],
        title: Text("E-Learning Lisan u Dawat"), backgroundColor: Colors.green[800],),
      // drawer:Theme(
    	// data: Theme.of(context).copyWith(
		  // canvasColor: Colors.green[800]
	    // ),
	    // child: new Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       ListTile(
      //         title: Text("Kamus", style: TextStyle(color: Colors.white70),),
      //         onTap: (){
      //           Navigator.of(context).pushNamed(KamusPage.tag);
      //         },
      //       ),
      //       // ListTile(
      //       //   title: Text("Contoh Kalimat", style: TextStyle(color: Colors.white70),),
      //       //   onTap: (){
      //       //     Navigator.of(context).pushNamed(ContohKalimat.tag);
      //       //   },
      //       // ),
      //       // ListTile(
      //       //   title: Text("Tambah Kata", style: TextStyle(color: Colors.white70),),
      //       //   onTap: (){
      //       //     Navigator.of(context).pushNamed(TambahKata.tag);
      //       //   },
      //       // ),
      //       // ListTile(
      //       //   title: Text("Bank Kata", style: TextStyle(color: Colors.white70),),
      //       //   onTap: (){
      //       //     Navigator.of(context).pushNamed(BankKata.tag);
      //       //   },
      //       // ),
      //     ],
      //   ),
      // ),
      // ),
      body: 
      
      SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: <Widget>[
                judul, SizedBox(),         
                cari,
                button,

              ],
            ),
          )
          ,),
      ),
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
