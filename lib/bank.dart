import 'package:flutter/material.dart';
import 'kamus.dart';
import 'contoh.dart';
import 'tambah.dart';

class BankKata extends StatefulWidget {
  static String tag = 'bank-page';
  @override
  _BankKataState createState() => _BankKataState();
}

class _BankKataState extends State<BankKata> {
  
    Future<String>createAlertDialog(BuildContext context){
  
    TextEditingController customController = TextEditingController();

    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text("Masukkan PIN"),
        content: TextField(
          controller: customController,
          obscureText: true,
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5,
            child: Text("Tutup"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          MaterialButton(
            elevation: 5,
            child: Text("OK"),
            onPressed: (){},
          )
        ],
      );
    });
  }






  List<String> approved=["Apv & NotApv","Not Approved", "Approved"];
  String _approved="Apv & NotApv";

  void pilihApproved(String value){
    setState(() {
      _approved=value;
    });
  }

  List<String> translate=["Trnlt & NotTrnlt","Not Translate", "Translate"];
  String _translate="Trnlt & NotTrnlt";

  void pilihTranslate(String value){
    setState(() {
      _translate=value;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    final judul = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text("Bank Kata", style: TextStyle(fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),),
        ),
Row(
          children: <Widget>[
            Container(
              width: 140,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
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
              margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 20),
          child: Align(
            alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                    ),
                    onPressed: (){
                        createAlertDialog(context);
                    },
                    color: Colors.orangeAccent[400],                   
                    icon: Icon(Icons.edit,color: Colors.white,),
                    label: Text("REQUEST EDIT", style: TextStyle(color: Colors.white)),
                  ),
          ),
        )
      ],
    );

  final cari = Column(
    children: <Widget>[
      TextFormField(
        keyboardType: TextInputType.text,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Cari kata disini...",
                  contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
      )
      ),
    DropdownButton(
      isExpanded: true,
      onChanged: (String value){
        pilihApproved(value);
      },    
      value: _approved,
      items: approved.map((String value){
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
    DropdownButton(
      isExpanded: true,
      onChanged: (String value){
        pilihTranslate(value);
      },    
      value: _translate,
      items: translate.map((String value){
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
    Padding(
          padding: const EdgeInsets.fromLTRB(7, 2, 0, 10),
          child: Align(
            alignment: Alignment.topRight,
            child: FlatButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
              onPressed: (){

              },
              color: Colors.blue[600],
              icon: Icon(Icons.search, color: Colors.white,),
              label: Text("Cari", style: TextStyle(color: Colors.white))
            ),
          ),
        )
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