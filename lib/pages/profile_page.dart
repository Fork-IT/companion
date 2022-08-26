import 'dart:math';
import 'package:finaltwo/exercise_zone/exercise_home.dart';
import 'package:finaltwo/feedback/FeedBack.dart';
import 'package:finaltwo/pages/music_getstarted.dart';
import 'package:finaltwo/pages/splash_screen.dart';
import 'package:finaltwo/ui/home_page.dart';
import 'package:finaltwo/ui/home_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finaltwo/pages/app_info.dart';
import 'package:finaltwo/pages/game_dashboard.dart';
import 'package:finaltwo/pages/login_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../identify/ui/identify_home_page.dart';
import '../ui/home_page1.dart';
import '../user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../feedback_form.dart';

int? theScore;
int? switchValue;
int global_score = 0;

class ProfilePage extends StatelessWidget{
  final Function(User?)? onSignOut;
  ProfilePage({this.onSignOut});


  var snackBar;
  //var notifyHelper;


//   @override
//   State<StatefulWidget> createState() {
//     return _ProfilePageState();
//   }
// }
//
// class _ProfilePageState extends State<ProfilePage>{
  Card profilePage(String title, String img, int index){
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index == 3 || index == 4
            ? BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Color(0xFF004B8D),
              Color(0xFFffffff),
            ],
          ),
          boxShadow: const[
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        )
            :BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Colors.cyan,
              Colors.amber,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
              Get.to(IdentifyHomePage());
              //1.item
            }
            if (index == 1) {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => GameDashboard()));
              Get.to(GameDashboard());
              //2.item
            }
            if (index == 2) {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              Get.to(HomePage());
              //3.item
            }
            if (index == 3) {
              //4.item
              Get.to(HomePage2());
            }
            if (index == 4) {
              Get.to(HomePage1());
              //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage1()));
              //5.item
            }
            if (index == 5) {
              //Get.to(MainPage1());
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Splash()));
              //6.item
            }
            if (index == 6) {
              Get.to(GetStart());
              //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage1()));
              //7.item
            }
            if (index == 7) {
              Get.to(ExerciseHome());
             //Get.to(HomePage1());
              //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage1()));
              //8.item
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 45),
              Center(
                child: Image.asset(
                img,
                height: 55,  //height: 75  --> changed due to overflow error of Jay's phone
                width: 75,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 170, 193, 232),
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.transparent ,
        items: [
          Icon(Icons.home),
          Icon(Icons.settings),
          Icon(Icons.info),
        ],
      ),
      appBar: AppBar(
        title: Text("Companion",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )
          ),
        ),
        actions: [
          //Container(
          //margin: EdgeInsets.only( top: 16, right: 16,),
          //child: Stack(
          //children: <Widget>[
          //Icon(Icons.notifications),
          //Positioned(
          //right: 0,
          //child: Container(
          //padding: EdgeInsets.all(1),
          //decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
          //constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
          //child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
          //),
          //)
          //],
          //),
          //)
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[

                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                profilePage("Identify Relation", "assets/identify.png", 0),
                profilePage("Game Zone", "assets/game.png", 1),
                //profilePage("Contact Family", "assets/call.png", 2),
                profilePage("Directions", "assets/location.png", 3),
                profilePage("Daily Tasks", "assets/todo.png", 4),
                //profilePage("Take Notes", "assets/note.png", 5),
                profilePage("Music Medicine", "assets/musicc.png", 6),
                profilePage("Exercise time !!", "assets/yoga.png", 7),
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).accentColor.withOpacity(0.5),
                  ]
              )
          ) ,

          child: ListView(
            children: [
              Text(''),
              Image.asset('assets/logo1.png',
              height: 180,),
              // DrawerHeader(
              //   // decoration: BoxDecoration(
              //   //   color: Theme.of(context).primaryColor,
              //   //   gradient: LinearGradient(
              //   //     begin: Alignment.topLeft,
              //   //     end: Alignment.bottomRight,
              //   //     stops: [0.0, 1.0],
              //   //     colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
              //   //   ),
              //   // ),
              //   child: Container(
              //     alignment: Alignment.bottomLeft,
              //     child: Text("Companion",
              //       style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              Text(''),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.app_settings_alt, size: _drawerIconSize,color: Theme.of(context).accentColor),
                title: Text('App Guide',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppInfo()),);
                },
              ),
              Text(''),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.app_settings_alt, size: _drawerIconSize,color: Theme.of(context).accentColor),
                title: Text('FeeBack',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FeedBack()),);
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_outlined, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () async {
                  print("clicked here");
                  await FirebaseAuth.instance.signOut().then((value) {
                    if (onSignOut != null)
                    {
                      onSignOut!(null);
                    }
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                            (route) => false);
                    Get.snackbar(
                      "You're now signed out",
                      "",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.white,
                      colorText: Colors.green,
                      icon: Icon(Icons.task_alt_rounded,
                        color: Colors.green,
                      ),
                    );
                  });
                  //SystemNavigator.pop();
                },
              ),
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.app_settings_alt, size: _drawerIconSize,color: Theme.of(context).accentColor),
                title: Text('Daily Message',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  final dttime = DateTime.now().hour;
                  var bodymsg="Happy Jansmathami :)";
                  var greetmsg;

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
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Today"),
                      content: Text(
                          "${greetmsg}"+"\n\n${bodymsg}"
                        // "Hello there a message from "
                      ),
                      actions: [
                        TextButton(
                            onPressed: () async => await launch("https://wa.me/${919016775087}?text=${greetmsg}"+"${bodymsg}"),
                            child: Text('Share on Whatsapp')
                        )
                      ],
                    ),
                  );
                },
              ),
<<<<<<< HEAD
              // SizedBox(height: 25,),
              // Text(
              //     "Reminder notification :",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontSize: 16,
              //         fontWeight: FontWeight.bold
              //     )
              // ),
              // SizedBox(height: 7,),
              // Text(
              //     "Turn ON to get reminder notification every hour.",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontSize: 15,
              //     )
              // ),
              //
              // SizedBox(height: 12,),
              // ToggleSwitch(
              //   minWidth: 150.0,
              //   cornerRadius: 20.0,
              //   activeBgColors: [[Colors.red[800]!], [Colors.green[800]!]],
              //   activeFgColor: Colors.white,
              //   inactiveBgColor: Colors.grey,
              //   inactiveFgColor: Colors.white,
              //   initialLabelIndex: switchValue,
              //   totalSwitches: 2,
              //   labels: ['Off', 'On'],
              //   radiusStyle: true,
              //   onToggle: (switchValue) async {
              //     print('switched to: $switchValue');
              //     await UserPreferences.setSwitchValue(switchValue!);
              //     if(switchValue == 0)
              //     {
              //       //off
              //       snackBar = SnackBar(
              //         content: Text('Reminder notification is turned OFF !'),
              //       );
              //       await notifyHelper.cancelNotification(1024);
              //     }
              //     else
              //     {
              //       //on
              //       snackBar = SnackBar(
              //         content: Text('Reminder notification is turned ON !'),
              //       );
              //       await notifyHelper.repeatNotification();
              //     }
              //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //   },
              // ),

=======
              SizedBox(height: 35,),
              Text(
                  "Total Score : ${global_score}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              ),
              // ElevatedButton(onPressed: () {
              //   Get.to()
              // }, child: Text(
              //   "Feedback"
              // )
              // )
>>>>>>> 4050a74a34c7a91e16a9b875a0e65683fb380e2b
            ],
          ),
        ),
      ),
    );
  }
}