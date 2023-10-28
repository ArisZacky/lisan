import 'package:flutter/material.dart';
import 'contoh.dart';
import 'tambah.dart';
import 'bank.dart';
import 'kamus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info/package_info.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class AboutPage extends StatefulWidget {
  static String tag = 'about-page';
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  _launchURL() async {
    const url = 'http://lisan.z4comp.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _getVersion(){
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String appName = packageInfo.appName; //ERZ4P, set di res/android manifest.xml
      String packageName = packageInfo.packageName; //com.erzap.erz4p_f, set di build.gradle
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;

      debugPrint(appName+packageName+version+buildNumber);
      if(this.mounted){
        setState(() {
          appver = version;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getVersion();
  }
  String appver = '';

  @override
  Widget build(BuildContext context) {
  final judul =
Container(
          width: double.infinity,
          child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50.0),
                height: 200.0,
                width: 200.0,
                child: Image.asset(
                  'images/Lisan.png',
                  scale: 1.0,
                ),
              ),
              Container(
                child: Text('v'+appver,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60.0),
                child: GestureDetector(
                  child: Text('http://lisan.z4comp.com',
                    style: TextStyle(
                      fontSize: 25.0,
                      decoration: TextDecoration.underline,
                      color: Colors.blue
                    ),
                  ),
                  onTap: (){
                    debugPrint("HYPERLINKNYA");
                    _launchURL();
                  },
                ),
              ),
            ],
          ),
        );




    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () { Navigator.of(context).pushReplacementNamed(KamusPage.tag); },
        ),

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
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24, right:24),
          children: <Widget>[
            judul, SizedBox(),         
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
