import 'package:finaltwo/match_pair/MatchPair.dart';
import 'package:finaltwo/match_pair/MatchPairData.dart';
import 'package:finaltwo/memory_game/screen/home.dart';
import 'package:finaltwo/puzzle_slide_game/home_page.dart';
import 'package:finaltwo/quiz_game/screens/welcome/welcome_screen.dart';
import 'package:finaltwo/tic_tac_toe/tic_tac_screen.dart';
import 'package:flutter/material.dart';

import '../puzzle_slide_game/puzzle_getstarted.dart';


class ChoiceMatchPair extends StatelessWidget {
  const ChoiceMatchPair({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 10,
        title: Text('Match the Pair') ,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange[500]!,
                Colors.pink[200]!,
                Colors.yellow[100]!,
                Colors.green[500]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>const MatchPair()),
                    );
                  },
                  child: Container(
                    height: 285,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(16.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 250,
                              child: Image.asset('assets/jodi.png',)
                          ),
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 40,
              ),

              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){

                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> (MatchPair())));

                    // Navigator.push(context,
                    //   MaterialPageRoute(
                    //       builder: (context)=> (MatchPairData())),
                    // );
                  },
                  child: Container(
                    height: 285,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(16.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 250,
                              child: Image.asset('assets/saath.png',)

                          ),

                        ],
                      ),
                    ),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 37,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
