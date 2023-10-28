import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CustomColor {
  static const Color defaultAndroid = Color(0xff737373);
  static const Color colorPrimary = Color(0xff369BD7);
  static const Color colorPrimaryLight = Color(0xff5BC0DE);
  static const Color colorPrimaryLight2 = Color(0xff4aaaf7);
  static const Color colorPrimaryDark = Color(0xff0288d1);
  static const Color colorAccent = Color(0xffffffff);

  static const Color colorBlack = Color(0xff333333);

  static const Color colorYellowLight = Color(0xfffff28f);
  static const Color colorGreyDark = Color(0xff808080);
  static const Color colorGrey = Color(0xff9A9A9A);
  static const Color colorGreyLight = Color(0xffd2d2d2);
  static const Color colorGreyVeryLight = Color(0xfff0f0f0);
  static const Color colorRed = Color(0xffFF0000);
  static const Color colorRedSoft = Color(0xffD9534F);
  static const Color colorGreen = Color(0xff4AA231);
  static const Color colorGreen2 = Color(0xff5dce3d);
  static const Color colorGreenLight = Color(0xff76ff03);
  static const Color colorGreenDark = Color(0xff377e22);
  static const Color colorBlue = Color(0xff4aaaf7);
  static const Color colorBlueDark = Color(0xff1976D2);
  static const Color colorBlueLight = Color(0xff678c9e);
  static const Color colorWhite = Color(0xffffffff);
  static const Color colorBrownLight = Color(0xffb99b74);

  static const Color colorButtonGreen = Color(0xff4D943B);
  static const Color colorButtonGreenLight = Color(0xff80BB16);
  static const Color colorButtonOrange = Color(0xffF0AD4E);

//  <!-- Screens background color-->
  static const Color bg_screen1 = Color(0xff369BD7);
  static const Color bg_screen2 = Color(0xfff64c73);
  static const Color bg_screen3 = Color(0xffc873f4);
  static const Color bg_screen4 = Color(0xff3395ff);

//  <!-- dots inactive colors -->
  static const Color dot_dark_screen1 = Color(0xff0288d1);
  static const Color dot_dark_screen2 = Color(0xffd1395c);
  static const Color dot_dark_screen3 = Color(0xffa854d4);
  static const Color dot_dark_screen4 = Color(0xff2278d4);

//  <!-- dots active colors -->
  static const Color dot_light_screen1 = Color(0xff5BC0DE);
  static const Color dot_light_screen2 = Color(0xfff98da5);
  static const Color dot_light_screen3 = Color(0xffe4b5fc);
  static const Color dot_light_screen4 = Color(0xff93c6fd);
}

class GlobalVariable {
  static const String LOGGED = 'logged';

  static String isFirstTimeKey = "isFirstTime"; // isFirstTime install aplikasi (untuk nampilin slide welcome apalah itu)

  static String loginEmailKey = "loginEmailKey";
  static String loginURLKey = "loginURLKey";
  static String loginRememberMeKey = "loginRememberMeKey";

  static String tglLastLoginKey = "tglLastLogin";

  static String urlPanelKey = "url";
  static String emailKey = "email";
  static String idUserKey = "idUser";
  static String idGrupOutletKey = "idGrupOutlet";
  static String grupOutletNamaKey = "grupOutletNama";

  static String settingIsAllowShowRekapPenjualanKey = "settingIsAllowShowRekapPenjualan";
  static String settingIsAllowShowRekapPenjualanHariIniKey = "settingIsAllowShowRekapPenjualanHariIni";
  static String settingIsAllowShowLabaInRekapPenjualanKey = "settingIsAllowShowLabaInRekapPenjualan";

  static String QUERY_TABLE_DATA_LOGIN = '''
      CREATE TABLE IF NOT EXISTS 'login' (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        $urlPanelKey TEXT,
        $emailKey TEXT,
        $idUserKey TEXT,
        $idGrupOutletKey TEXT,
        $grupOutletNamaKey TEXT,
        $tglLastLoginKey TEXT,
        $settingIsAllowShowRekapPenjualanKey INTEGER DEFAULT 0,
        $settingIsAllowShowRekapPenjualanHariIniKey INTEGER DEFAULT 0,
        $settingIsAllowShowLabaInRekapPenjualanKey INTEGER DEFAULT 0        
      )
    ''';

  static String QUERY_DROP_TABLE = '''
    DROP TABLE IF EXIST 'login' ''';


  // lihat disini untuk list Date and Time Patterns
  // https://developer.android.com/reference/java/text/SimpleDateFormat#date-and-time-patterns
  static String dateFormatInput = "yyyy-MM-dd HH:mm:ss";
  static String dateFormatOutput = "dd MMM yyyy - HH.mm";
  static String dateFormatInputTimeZone = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"; // date format dari server
  static String dateFormatNormal = "dd-MM-yyyy";
}