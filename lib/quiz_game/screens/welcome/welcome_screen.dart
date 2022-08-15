import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:finaltwo/quiz_game/constants.dart';
import 'package:finaltwo/quiz_game/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Quizzie'),
        backgroundColor: Colors.cyan,
        elevation: 20,
        centerTitle: true,
      ) ,
      backgroundColor: Colors.cyan.shade400,
      body: Stack(
        children: [
          //SvgPicture.asset("assets/icons/clock.svg", fit: BoxFit.none),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Quick Quizzie !!\n",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold,
                    fontFamily: "Merriweather"),
                  ),
                  Text("Unlocking knowledge at the speed of thought !!",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "DynaPuff"
                  ),),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.all(Radius.circular(120)),
                      ),
                      child: Text(
                        "👉 \t Start \t 👈",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: Colors.black,
                        fontSize: 18),
                      ),
                    ),
                  ),
                  Spacer(flex: 4), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
