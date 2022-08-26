import 'package:finaltwo/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finaltwo/quiz_game/constants.dart';
import 'package:finaltwo/quiz_game/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finaltwo/quiz_game/screens/welcome/welcome_screen.dart';
import 'package:flutter_share/flutter_share.dart';

class ScoreScreen extends StatelessWidget {
  QuestionController _qnController = Get.put(QuestionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: <Widget>[
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    ?.copyWith(color: kSecondaryColor),
              ),
              OutlinedButton(
                onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                          (route) => false);
                  global_score = global_score + (_qnController.numOfCorrectAns * 10);
                },
                child: Text(
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    "Continue"
                ),
                //borderSide: BorderSide(width: 3.0 , color: Colors.indigo),
              ),
              OutlinedButton(
                onPressed: (){
                  shareApp();
                },
                child: Text(
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.greenAccent
                    ),
                    "Share"
                ),
                //borderSide: BorderSide(width: 3.0 , color: Colors.indigo),
              )
              ,Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
  Future<void> shareApp() async {
    await FlutterShare.share(
        title: 'title',
        text: 'Hey there! I got ${_qnController.numOfCorrectAns * 10} score in Quiz Game of Companion application\nYou can also try this!',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }
}
