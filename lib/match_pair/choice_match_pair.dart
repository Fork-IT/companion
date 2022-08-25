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
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(8.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 150,
                              child: Image.asset('assets/drag.png',)
                          ),
                          const Spacer(),
                          const Text(
                            'Static Match',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          )
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

              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> (MatchPairData())),
                    );
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Padding(
                      padding:  const EdgeInsets.all(8.0),
                      child: Column(
                        children:  [
                          SizedBox(
                              height: 150,
                              child: Image.asset('assets/quizzie.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Match Static Data',
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),

                          )
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
            ],
          ),
        ),
      ),
    );
  }
}
