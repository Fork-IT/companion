import 'dart:async';
import 'dart:math';
import 'package:finaltwo/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import '../decisions_tree.dart';
import '../notification_service.dart';
import '../user_preferences.dart';

var notifyHelper;

void backgroundCallback(Uri? data) async {
  print(data);

  if (data!.host == 'titleclicked') {
    final greetings = [
      'Play Games !',
      'Contact your loved once !',
      'Get directions !',
      'Set to-do tasks !',
      'Do exercise !',
      'Listen to music !',
    ];
    final selectedGreeting = greetings[Random().nextInt(greetings.length)];

    await HomeWidget.saveWidgetData<String>('title', selectedGreeting);
    await HomeWidget.updateWidget(
        name: 'HomeWidgetExampleProvider', iOSName: 'HomeWidgetExample');
  }
}



class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeWidget.setAppGroupId('YOUR_GROUP_ID');
    HomeWidget.registerBackgroundCallback(backgroundCallback);
    switchValue = UserPreferences.getSwitchValue() ?? 0;
    _sendAndUpdate();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkForWidgetLaunch();
    HomeWidget.widgetClicked.listen(_launchedFromWidget);
  }

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => DecisionsTree()), (
            route) => false);
      });
    });

    new Timer(
        Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
        true; // Now it is showing fade effect and navigating to Login page
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Theme
              .of(context)
              .colorScheme
              .secondary, Theme
              .of(context)
              .primaryColor
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 350.0,
            width: 350.0,
            child: Center(
              child: ClipOval(
                child: Image.asset("assets/logo.png"),
                //child: Icon(Icons.health_and_safety_rounded, size: 128,),
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 2.0,
                    offset: Offset(5.0, 3.0),
                    spreadRadius: 9.0,
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }

  void _checkForWidgetLaunch() {
    HomeWidget.initiallyLaunchedFromHomeWidget().then(_launchedFromWidget);
  }

  void _launchedFromWidget(Uri? uri) {

  }

  Future<void> _sendAndUpdate() async {
    try {
      await Future.wait([
        HomeWidget.saveWidgetData<String>('title', "Companion"),
        HomeWidget.saveWidgetData<String>('message', "Companion - your true Buddy is with you !"),
      ]);
    } on PlatformException catch (exception) {
      debugPrint('Error Sending Data. $exception');
    }
    try {
      await HomeWidget.updateWidget(
          name: 'HomeWidgetExampleProvider', iOSName: 'HomeWidgetExample');
    } on PlatformException catch (exception) {
      debugPrint('Error Updating Widget. $exception');
    }
  }

}