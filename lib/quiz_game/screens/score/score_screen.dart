import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finaltwo/quiz_game/constants.dart';
import 'package:finaltwo/quiz_game/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:finaltwo/quiz_game/screens/welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
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
                        builder: (context) => WelcomeScreen(),
                      ),
                          (route) => false);
                },
                child: Text(
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    "Continue"
                ),
                //borderSide: BorderSide(width: 3.0 , color: Colors.indigo),
              )
              ,Spacer(),
              Text(
                "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
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
}
