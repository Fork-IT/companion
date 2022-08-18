import 'package:finaltwo/db/db_helper2.dart';
import 'package:finaltwo/services/yogadb.dart';
import 'package:finaltwo/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'db/db_helper.dart';
import 'db/db_helper1.dart';
import 'pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

//sample comment

void main() async{
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.light,
  //     statusBarColor: Colors.transparent,
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DBHelper.initDb();
  await DBHelper1.initDb();
  await DBHelper2.initDb();
  await UserPreferences.init();
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  //Color _primaryColor = HexColor('#DC54FE');
  //Color _accentColor = HexColor('#8A02AE');

  // Design color
  //Color _primaryColor= HexColor('#FFC867');
  //Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  Color _primaryColor= HexColor('#D44CF6');
  Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Companion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: _accentColor),
      ),
      home: SplashScreen(title: 'Companion'),
    );
  }
}
