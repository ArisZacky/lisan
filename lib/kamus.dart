import 'dart:math';

import 'package:flutter/material.dart';
import 'about.dart';
import 'package:flutter/services.dart';
import 'model.dart';
import 'contoh.dart';
import 'kata2.dart';
import 'notifclicked.dart';
import 'tambah.dart';
import 'kuis.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:kamus/model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class KamusPage extends StatefulWidget {
  static String tag = 'kamus-page';
  @override
  _KamusPageState createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {



  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future onSelectNotification(String payload) {
      Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new NotifPage()),
    );
  }

  showNotification() async {
var time = new Time(12, 30, 0);
var androidPlatformChannelSpecifics =
    new AndroidNotificationDetails('repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
var iOSPlatformChannelSpecifics =
    new IOSNotificationDetails();
var platformChannelSpecifics = new NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.showDailyAtTime(
    0,
    'Lisan u Dawat',
    'Hey waktunya belajar, klik yuk!',
    // ${(time.hour)}:${(time.minute)}:${(time.second)}
    time,
    platformChannelSpecifics);
  }

    showNotification2() async {
var time = new Time(18, 30, 0);
var androidPlatformChannelSpecifics =
    new AndroidNotificationDetails('repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
var iOSPlatformChannelSpecifics =
    new IOSNotificationDetails();
var platformChannelSpecifics = new NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.showDailyAtTime(
    1,
    'Lisan u Dawat',
    'Hey waktunya belajar, klik yuk!',
    // ${(time.hour)}:${(time.minute)}:${(time.second)}
    time,
    platformChannelSpecifics);
  }

    showNotification3() async {
var time = new Time(21, 30, 0);
var androidPlatformChannelSpecifics =
    new AndroidNotificationDetails('repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
var iOSPlatformChannelSpecifics =
    new IOSNotificationDetails();
var platformChannelSpecifics = new NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await flutterLocalNotificationsPlugin.showDailyAtTime(
    2,
    'Lisan u Dawat',
    'Hey waktunya belajar, klik yuk!',
    // ${(time.hour)}:${(time.minute)}:${(time.second)}
    time,
    platformChannelSpecifics);
  }

  @override
  void initState() {
    // _loadSuggest("");
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = IOSInitializationSettings();
    var initSettings = InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings,
        onSelectNotification: onSelectNotification);
         
  }

  
  // List<Kamus> _list = [];
  // List<Kamus> _search = [];
  bool isLoading = false;
  bool terjemahan = false;
  TextEditingController caricontroller = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<dynamic>> key = new GlobalKey();
  // TextEditingController controller = new TextEditingController();
  AutoCompleteTextField searchTextField;
  Map autocompletedata;
  List<dynamic> list_kata;
  // static List<Kamus> kata = new List<Kamus>();

  //   void getUsers() async {
  //   try {
  //     final response =
  //         await http.get("http://lisan.z4comp.com/kamus/auto_complete.json?term=&maxRows=20");
  //     if (response.statusCode == 200) {
  //       kata = loadUsers(response.body);
  //       print('kata: ${kata.length}');
  //     } else {
  //       print("Error getting users.");
  //     }
  //   } catch (e) {
  //     print("Error getting users.");
  //   }
  // }
 
  // static List<Kamus> loadUsers(String jsonString) {
  //   final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  //   return parsed.map<Kamus>((json) => Kamus.fromJson(json)).toList();
  // }
  // @override
  // void initState() {
  //   _loadData('lud');
  //   super.initState();
  // }
List<String> kamus3 = new List<String>();
   void _loadSuggest(String term) async {
    try {
      // print("carik tok" + carik);
      // kamus = new List<Kamus>();
      // String carik2 = carik ?? "";
      final response =
          await http.get("http://lisan.z4comp.com/kamus/auto_complete.json?term="+term+"&maxRows=20");
          // await Future.delayed(Duration(seconds: 3));
          // print("responsenya suggest" + response.statusCode.toString());
      if (response.statusCode == 200) {
        // print(jsonDecode(response.body.length.toString()));
        // var length = ((response.body.length));
        // print (l
        setState(() {
          kamus3 = new List<String>();
                  list_kata = jsonDecode(response.body);
                  debugPrint(list_kata.toString());
        for (int i = 0 ; i<list_kata.length; i++){
          kamus3.add(list_kata[i]['kata']);
        }
        debugPrint("---------------");
        debugPrint(kamus3.toString());
        });

        // print(jsonDecode(response.body).toString());
        // kamus = loadKamus(response.body);
        // kamus3 = jsonDecode(response.body)['kata'];
        // print("KAMOES 3" + kamus3.toString());
        // setState(() {
        //   for (Map i in kamus2) {
        //     _list.add(Kamus.fromJson(i));
        //   }
        // });
        
        // print(kamus3[0] ['kata']);
        // print('kamus3: ${kamus3.toString()}');
        // setState(() {
        //              terjemahan=true;
        //              isLoading=false;
        //             });
        // print('tes2' + jsonDecode(response.body.toString()));
        // print('Kamus: ${kamus.length}');
      } else {
        print("responsekamus32" + response.statusCode.toString());
      }
    } catch (e) {
      print("responsekamus33 :" + e.toString());
    }
  }


  List<String> _loadNigg(String query) {
    List<String> matches = List();
    matches.addAll(kamus3);

    matches.retainWhere((s) => s.contains(query));
    // matches.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    // matches.retainWhere((s, a) => s.kamus3.compareTo(a.kamus3));
    // itemsorter: (a, b) {
    //                 return a.kamus3.compareTo(b.kamus3);
    //               };
    return matches;
  }



  //   @override
  // void initState() {
  //   _loadSuggest();
  //   super.initState();
  // }
  

  // List<Kamus> kamus;
  // static List<Kamus> kamus3 = new List<Kamus>();
  List<dynamic> kamus2 = new List<dynamic>();
   void _loadData(String carik) async {
    try {
      setState(() {
        isLoading = true;
      });
      print("carik tok" + carik);
      // kamus = new List<Kamus>();
      String carik2 = carik ?? "";
      final response =
          await http.get("http://lisan.z4comp.com/kamus.json?kata=" + carik2);
          print("response" + response.statusCode.toString());
      if (response.statusCode == 200) {
        print(jsonDecode(response.body).toString());
        // kamus = loadKamus(response.body);
        kamus2 = jsonDecode(response.body)['list_kata'];
        // setState(() {
        //   for (Map i in kamus2) {
        //     _list.add(Kamus.fromJson(i));
        //   }
        // });
        
        print(kamus2[0] ['lud']);
        print('kamus2: ${kamus2.toString()}');
        setState(() {
                     terjemahan=true;
                     isLoading=false;
                    });
        // print('tes2' + jsonDecode(response.body.toString()));
        // print('Kamus: ${kamus.length}');
      } else {
        print("response2" + response.statusCode.toString());
        setState(() {
                     isLoading=false;
                    });
      }
    } catch (e) {
      print("response3 :" + e.toString());
      setState(() {
                     isLoading=false;
                    });
    }
  }

  // static List<Kamus> loadKamus(String jsonString){
  //   final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
  //   return parsed.map<Kamus>((json) => Kamus.fromJson(json)).toList();
  // }
 
  // static List<Kamus> loadKamus(String jsonString) {
  //   List<Kamus> list = new List<Kamus>();
  //   list.add(Kamus());
  //   return list;
  //   // final parsed = json.decode(jsonString)['list_kata'] ['lud'].cast<Map<String, dynamic>>();
  //   // return parsed.map<Kamus>((json) => Kamus.fromJson(json)).toList();
  // }
  // void _loadDataa() async{
  //   await KamusViewModel.loadKamus();
  // }



  //   onSearch(String lud) async {
  //   _search.clear();
  //   if (lud.isEmpty) {
  //     setState(() {});
  //     return;
  //   }

  //   _list.forEach((f) {
  //     if (f.lud.contains(text))
  //       _search.add(f);
  //   });

  //   setState(() {});
  // }

  

  // Widget row(Kamus kamus) {
  //   print("test" + kamus.lud);
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Text(
  //         kamus.lud,
  //         style: TextStyle(fontSize: 16.0),
  //       ),
  //       SizedBox(
  //         width: 10.0,
  //       ),
  //     ],
  //   );
  // }
  @override
  Widget build(BuildContext context) {

    final judul = 
      Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
          child: Text("Kamus", style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w300),),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text("Lisan u Dawat", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        // Row(
        //   children: <Widget>[
            Container(
              width: 130,
              margin: EdgeInsets.fromLTRB(5, 0, 0, 10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("Total Kata: 1398",textAlign: TextAlign.center,style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white,)),
              ),
            ),
            Container(
              width: 190,
              margin: EdgeInsets.fromLTRB(15, 0, 0, 10),
              decoration: BoxDecoration(
                color: Colors.yellowAccent[700],
                borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text("Missing Translation: 784", textAlign: TextAlign.center ,style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black,)),
              ),
            ),
        //   ],
        // ),
      ],
    );
    print(kamus2.toString());
    final cari =
    

        Column(
        children: <Widget>[
            Row(
            children: <Widget>[
              // isLoading ? CircularProgressIndicator():
              Expanded(
                child: 
                TypeAheadField(
  textFieldConfiguration: TextFieldConfiguration(
    // onChanged:(String value) async {
    //           if (value != '13') {
    //             return;
    //           }
    //         },
    controller: caricontroller,
    autofocus: true,
    onChanged: (value) {
      
    },
    decoration: InputDecoration(
      filled: true,
      hintText: "Cari terjemahan disini...",
      contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
    )
  ),
  debounceDuration: Duration(milliseconds: 500),

  // errorBuilder: (BuildContext context, Object error) =>
  // Text(
  //   '$error',
  //   style: TextStyle(
  //     color: Theme.of(context).errorColor
  //   )
  // ),
  // loadingBuilder: Text("Loading"),
  // suggestionsBoxController: ,
  suggestionsCallback: (pattern) async{
    try{
      print("Suggest9999" + kamus3.toString());
    final response =
          await http.get("http://lisan.z4comp.com/kamus/auto_complete.json?term="+pattern+"&maxRows=20");
          // prin t("responsenya suggest" + response.statusCode.toString());
          debugPrint("Status" + response.statusCode.toString());
      if (response.statusCode == 200) {
        // print(jsonDecode(response.body.length.toString()));
        // var length = ((response.body.length));
        // print (l
        if(jsonDecode(response.body) == "" ){
          debugPrint("Listtttt" + list_kata.toString());
          setState(() {
            kamus3 = new List<String>();
          });
        }else{
          list_kata = jsonDecode(response.body);
          setState(() {
              for (int i = 0 ; i<list_kata.length; i++){
              kamus3.add(list_kata[i]['kata']);
              }
                  

        debugPrint("---------------");
        debugPrint(kamus3.toString());
        });
        }
        

        // print(jsonDecode(response.body).toString());
        // kamus = loadKamus(response.body);
        // kamus3 = jsonDecode(response.body)['kata'];
        // print("KAMOES 3" + kamus3.toString());
        // setState(() {
        //   for (Map i in kamus2) {
        //     _list.add(Kamus.fromJson(i));
        //   }
        // });
        
        // print(kamus3[0] ['kata']);
        // print('kamus3: ${kamus3.toString()}');
        // setState(() {
        //              terjemahan=true;
        //              isLoading=false;
        //             });
        // print('tes2' + jsonDecode(response.body.toString()));
        // print('Kamus: ${kamus.length}');
      } else {
        print("responsekamus32" + response.statusCode.toString());
      }
    return kamus3;
    }catch(e){
      debugPrint(e.toString());
                setState(() {
            kamus3 = new List<String>();
          });
          return kamus3;
    }
    
  },
  hideSuggestionsOnKeyboardHide: false,
  itemBuilder: (context, suggestion) {
    return ListTile(
      title: Text(suggestion.toString()),  
      // subtitle: Divider(color: Colors.blue, height: 30, endIndent: 10,)
    );
  },
  onSuggestionSelected: (kamus3) {
    this.caricontroller.text = kamus3;
  },
  keepSuggestionsOnLoading: true,
  loadingBuilder: (BuildContext context){
        return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          SizedBox(
          child: CircularProgressIndicator(),
          height: 10,
          width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Loading....."),
          )
        ],
      ),
    );
  },
  // noItemsFoundBuilder: (BuildContext context){

  // },
),




                // child: TextFormField(
                //   autocorrect: true,
                //   // onChanged: ,
                //   controller: caricontroller,
                //   keyboardType: TextInputType.text,
                //   key: key,
                //   decoration: InputDecoration(
                //     filled: true,
                //     hintText: "Cari terjemahan disini...",
                //     contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.5)),
                //   )
                // ),

                // child: searchTextField = AutoCompleteTextField<Kata>(
                //   key: key,
                //   controller: caricontroller,
                //   clearOnSubmit: false,
                //   suggestions: kamus3,
                //   style: TextStyle(color: Colors.black, fontSize: 16.0),
                //   itemFilter: (item, query) {
                //     return item.kata
                //         .toLowerCase()
                //         .startsWith(query.toLowerCase());
                //   },
                //   itemSorter: (a, b) {
                //     return a.kata.compareTo(b.kata);
                //   },
                //   itemSubmitted: (item) {
                //     caricontroller.text =item.kata;
                //     // setState(() {
                //     //   searchTextField.textField.controller.text = item.lud;
                //     // });
                //   },
                //   itemBuilder: (context, item) {
                //     // ui for the autocompelete row
                //       // return row(item);
                //         return Text(
                //               item.kata,
                //               style: TextStyle(fontSize: 16.0),
                //             );
                //   },
                //   suggestionsAmount: 10,
                //   keyboardType: TextInputType.text,
                //   decoration: InputDecoration(
                //     filled: true,
                //     hintText: "Cari terjemahan disini...",
                //     contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
                //   ),
                // )

                // child: searchTextField = AutoCompleteTextField<Kamus>(
                //   controller: caricontroller,
                //   key: key,
                //   clearOnSubmit: false,
                //   suggestions: PlayersViewModel.kata2,
                //   itemFilter: (item, query){
                //     return item.kata.toLowerCase().startsWith(query.toLowerCase());
                //   },
                //   itemSorter: (a, b){
                //     return a.kata.compareTo(b.kata);
                //   },
                //   itemSubmitted: (item){
                //     setState(() {
                //       searchTextField.textField.controller.text = item.kata;
                //     });
                //   },
                //   itemBuilder: (context, item){
                //     return Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget>[
                //       Text(
                //         item.kata,
                //         style: TextStyle(fontSize: 16.0),
                //       )
                //     ]
                //     );
                //   },
                // ),


              ),
                SizedBox(
                  height:32,
                  child: FlatButton.icon(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.5)),
                    onPressed:() {
                      
                      FocusScope.of(context).unfocus();
                      _loadData(caricontroller.text);
                      showNotification();
                      showNotification2();
                      showNotification3();
                                      //  _submit();
                        // setState(() {
                        //  terjemahan=true;
                        // });
                      
                     print(caricontroller.text.toString());
                    },
                        
                    icon: Icon(Icons.search, color: Colors.white,),
                    color: Colors.blue,
                    label: Text("Cari", style: TextStyle(color: Colors.white),),
                  ),
                ),
            ],
          ),

          Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text("Dalam pengembangan, kata yang Anda cari mungkin belum terdaftar dalam Database sistem", textAlign: TextAlign.center, style: TextStyle(fontSize: 13, color: Colors.amber[800], fontWeight: FontWeight.w600),)),
        ],
      );



    print("test512232132:" + kamus2.toString());
            final detail = 
            isLoading == true ? SpinKitCircle(color: Colors.green):
            Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: kamus2  == null ? 0 : kamus2.length,
              itemBuilder: (context, index){

                return Container(
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
  
                  child: Padding(
  
                    padding: const EdgeInsets.fromLTRB(7, 30, 0, 10),
  
                    child: Align(
  
                      alignment: Alignment.topLeft,
  
                      child: 
                        terjemahan==false?
                        
                        Text('TEST'):
                      // CircularProgressIndicator():
                      Column(
  
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
                                  child: Text(kamus2[index]['lud'], textAlign: TextAlign.center ,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),)
  
                                ),
  
                                
  
                                Expanded(
                                  child: Padding(
                                    
                                    padding: const EdgeInsets.only(left: 10),
  
                                    child: Text(kamus2[index]['ind'], style: TextStyle(fontSize: 15),),
  
                                  ),
                                )
  
                              ],
  
                            ),
  
                          ),
  
                        Container(
  
                          alignment: Alignment.topLeft,
  
                          padding: EdgeInsets.fromLTRB(2, 5, 0, 10),
  
                          child: Text(kamus2[index]['kalimat_lud'], style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
  
                        ),
  
                        Container(
  
                          alignment: Alignment.topLeft,

                          padding: EdgeInsets.fromLTRB(2, 0, 0, 10),
  
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.blue, width: 2)
                            )
                          ),

                          child: Text(kamus2[index]['kalimat_ind'], style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
  
                        )
  
                      ],
  
                    ) 
  
                    
  
  
  
                    ),
  
                  ),
  
                  
  
                )
                    ],
                  ),
                );
              },
            )
            );


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
           IconButton(icon: Icon(Icons.info_outline),
           onPressed: (){Navigator.of(context).pushNamed(AboutPage.tag);
           }),
        ],
        title: Text("E-Learning Lisan u Dawat"), backgroundColor: Colors.green[800],),
      // drawer:Theme(
    	// data: Theme.of(context).copyWith(
		  // canvasColor: Colors.green[800]
	    // ),
	    // child: new Drawer(
      //   child: ListView(
      //     children: <Widget>[
      //       // ListTile(
      //       //   title: Text("Exit", style: TextStyle(color: Colors.white70),),
      //       //   onTap: (){
      //       //     SystemNavigator.pop();
      //       //   },
      //       // ),
      //       ListTile(
      //         title: Text("Contoh Kalimat", style: TextStyle(color: Colors.white70),),
      //         onTap: (){
      //           Navigator.of(context).pushNamed(NotifPage.tag);
      //         },
      //       ),
      // //       // ListTile(
      // //       //   title: Text("Tambah Kata", style: TextStyle(color: Colors.white70),),
      // //       //   onTap: (){
      // //       //     Navigator.of(context).pushNamed(TambahKata.tag);
      // //       //   },
      // //       // ),
      // //       // ListTile(
      // //       //   title: Text("Bank Kata", style: TextStyle(color: Colors.white70),),
      // //       //   onTap: (){
      // //       //     Navigator.of(context).pushNamed(BankKata.tag);
      // //       //   },
      // //       // ),
      //     ],
      //   ),
      // ),
      // ),
      
      body: 
      
      // ModalProgressHUD(
        
      //    inAsyncCall: _saving,
        //  opacity: 0.3,
        //  dismissible: true,
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 24, right:24),
                child: Column(
                  children: <Widget>[
                    judul, SizedBox(),         
                    cari, SizedBox(),
                    // FutureBuilder(
                    //   future: _loadData(''),
                    //   builder: (context, snapshot){
                    //     if (snapshot.hasData){
                    //       print(snapshot.data);
                    //       return ListView.builder(
                    //         itemCount: kamus2.length,
                    //         itemBuilder: (context, index){
                    //           return detail;
                    //         },
                    //       );
                    //     } else {
                    //       return Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //   }
                    // ),
                  detail,

                  ],
                ),
              )
              ,),
                   
      // ),
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
