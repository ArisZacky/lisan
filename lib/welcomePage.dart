import 'package:flutter/material.dart';
import 'globalVariable.dart';
import 'kamus.dart';

class WelcomePage extends StatefulWidget {
    @override
    _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: CustomColor.colorPrimary,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: CustomColor.colorWhite,
                    width: 0.5,
                  )
                )
              ),
                height: 60.0,
                child: RaisedButton(
                  color: CustomColor.colorPrimary,
                    onPressed: (){
//                        Navigator.popAndPushNamed(context, '/dashboard');
                      Navigator.of(context).pushReplacementNamed(KamusPage.tag);
                      // Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (Route<dynamic> route) => false);
                    },
                    child: Text('START',
                        style: TextStyle(
                            fontSize: 16.0,
                          color: CustomColor.colorWhite,
                        ),
                    ),
                ),
            ),
            body: Container(
                child: SafeArea(
                    child: Center(
                      child: Stack(
                        children: <Widget>[
                          SingleChildScrollView(
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("Selamat Datang di",
                                    style: TextStyle(
                                        fontSize: 27.0,
                                        color: CustomColor.colorWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text("Lisan u Dawat",
                                    style: TextStyle(
                                        fontSize: 27.0,
                                        color: CustomColor.colorWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    height: 120.0,
                                    child: Image.asset(
                                      'images/Lisan.png',
                                      scale: 1.0,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20.0),
                                    child: Text('Aplikasi ini bertujuan untuk membantu dalam mempelajari Lisan u Dawat \n \n Kamus dalam aplikasi ini dapat menterjemahkan dua arah antara Lisan u Dawat dan Indonesia \n \n Kedepannya aplikasi ini akan terus berkembang untuk mempermudah dalam proses pembelajaran',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: CustomColor.colorWhite
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
            ),
        );
    }
}
