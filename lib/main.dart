import 'package:flutter/material.dart';
import 'package:kamus/welcomePage.dart';
import 'kamus.dart';
import 'contoh.dart';
import 'tambah.dart';
import 'bank.dart';
import 'kuis.dart';
import 'about.dart';
import 'notifclicked.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'sharedPreferences.dart' as sp;
import 'globalVariable.dart' as gv;



void main() async{
  runApp(MyApp());
} 


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;


    Future onSelectNotification(String payload) async {
    debugPrint("payload : $payload");
    await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => KuisPage()),
      );
  }

    showNotification() async {
    var android = AndroidNotificationDetails(
        'channel id', 'channel name', 'channel description');
    var iOS = IOSNotificationDetails();
    var platform = NotificationDetails(android, iOS);
    var scheduledNotificationDateTime =
        new DateTime.now().add(Duration(seconds: 10));
    await flutterLocalNotificationsPlugin.schedule(0, 'Title ', 'Body', scheduledNotificationDateTime, platform);
  }

 
  bool firsttime;
  @override
  void initState() {
    super.initState();
    _loadInit();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }
  _loadInit () async {
      bool tempfirsttime = await sp.SharedPref.getBool(gv.GlobalVariable.isFirstTimeKey);
      debugPrint(firsttime.toString());
      debugPrint(tempfirsttime.toString());
      if(tempfirsttime == null){
      debugPrint(firsttime.toString());
      await sp.SharedPref.setBool(gv.GlobalVariable.isFirstTimeKey, false);
      setState(() {
       firsttime = true; 
      debugPrint(firsttime.toString());
      debugPrint(tempfirsttime.toString());
      });     
      }
  }




  final routes = <String, WidgetBuilder>{
    KamusPage.tag: (context) => KamusPage(),
    ContohKalimat.tag: (context) => ContohKalimat(),
    TambahKata.tag: (context) => TambahKata(),
    BankKata.tag: (context) => BankKata(),
    KuisPage.tag: (context) => KuisPage(),
    NotifPage.tag: (context) => NotifPage(),
    AboutPage.tag: (context) => AboutPage(),
  };

  

  @override
  Widget build(BuildContext context) {
return GestureDetector(
        onTap: () {
FocusScope.of(context).requestFocus(new FocusNode());
      },
    child: MaterialApp(
      title: 'Lisan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: firsttime==true? WelcomePage(): KamusPage(),
      routes: routes,
    )
  );
}
  
//   showNotification() async{
//   var time = new Time(12, 30, 0);
// var androidPlatformChannelSpecifics =
//     new AndroidNotificationDetails('repeatDailyAtTime channel id',
//         'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
// var iOSPlatformChannelSpecifics =
//     new IOSNotificationDetails();
// var platformChannelSpecifics = new NotificationDetails(
//     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
// await flutterLocalNotificationsPlugin.showDailyAtTime(
//     0,
//     'show daily title',
//     'Daily notification shown at approximately ${time.hour}:${time.minute}:${time.second}',
//     time,
//     platformChannelSpecifics);
// }
//   showNotification2() async{
//   var time = new Time(18, 30, 0);
// var androidPlatformChannelSpecifics =
//     new AndroidNotificationDetails('repeatDailyAtTime channel id',
//         'repeatDailyAtTime channel name', 'repeatDailyAtTime description');
// var iOSPlatformChannelSpecifics =
//     new IOSNotificationDetails();
// var platformChannelSpecifics = new NotificationDetails(
//     androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
// await flutterLocalNotificationsPlugin.showDailyAtTime(
//     1,
//     'show daily title',
//     'Daily notification shown at approximately ${time.hour}:${time.minute}:${time.second}',
//     time,
//     platformChannelSpecifics);
// }
}