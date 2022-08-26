import 'dart:async';
import 'dart:math';
import 'package:finaltwo/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_widget/home_widget.dart';
import '../decisions_tree.dart';
import '../notification_service.dart';
import '../user_preferences.dart';
import 'package:flutter_share/flutter_share.dart';

var notifyHelper;
var greetmsg;

void backgroundCallback(Uri? data) async {
  print(data);

  if (data!.host == 'titleclicked') {
    final greetings = [
      'Play Games !',
      'Get directions !',
      'Set to-do tasks !',
      'Do exercise !',
      'Listen to music !',
      'Identify your loved ones'
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
    final dttime = DateTime.now().hour;
    var bodymsg="Happy Jansmathami :)";
    greetmsg;

    if(dttime > 5 && dttime < 12){
      greetmsg = "Good Morning!!";
    }else if(dttime > 12 && dttime < 17){
      greetmsg = "Good Afternoon!!";
    }
    else if(dttime > 17 && dttime < 20){
      greetmsg = "Good Evening!!";
    }
    else {
      greetmsg = "Good Night!!";
    }
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => DecisionsTree()), (
            route) => false);
        showDialog(
          context: context,
          builder: (ctx) =>
              AlertDialog(
                title: Image(image: AssetImage('assets/music.png'),width: 500, height: 250,),

                // // title: Text(
                //   Image(image: AssetImage('assets/music.png'),width: 500, height: 250,),
                //   //"Hello! ${greetmsg}\n\nHappy Janmashtami, May the blessings of lord Krishna always be with you and your family."
                // ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      shareApp();
                    },
                    child: const Text("Share"),
                  ),
                ],
              ),
        );
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

  Future<void> shareApp() async {
    await FlutterShare.share(
        title: 'title',
        text: 'Hello! ${greetmsg}\n\nHappy Janmashtami, May the blessings of lord Krishna always be with you and your family.',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
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
        HomeWidget.saveWidgetData<String>('message', "Companion - your true buddy is with you !"),
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