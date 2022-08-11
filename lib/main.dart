import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'db/db_helper.dart';
import 'db/db_helper1.dart';
import 'pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

//sample comment

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DBHelper.initDb();
  await DBHelper1.initDb();
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
