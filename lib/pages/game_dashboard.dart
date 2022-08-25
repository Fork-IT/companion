import 'package:finaltwo/match_pair/MatchPair.dart';
import 'package:finaltwo/memory_game/screen/home.dart';
import 'package:finaltwo/puzzle_slide_game/home_page.dart';
import 'package:finaltwo/quiz_game/screens/welcome/welcome_screen.dart';
import 'package:finaltwo/tic_tac_toe/tic_tac_screen.dart';
import 'package:flutter/material.dart';

import '../match_pair/choice_match_pair.dart';
import '../puzzle_slide_game/puzzle_getstarted.dart';


class GameDashboard extends StatelessWidget {
  const GameDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 10,
        title: Text('Game Zone') ,
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
                          builder: (context)=>const ChoiceMatchPair()),
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
                              child: Image.asset('assets/images/drag.png',)
                          ),
                          const Spacer(),
                          const Text(
                            'Match the pair',
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
                          builder: (context)=> WelcomeScreen()),
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
                              child: Image.asset('assets/images/quizzie.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Quick Quizzie',
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
              Padding(
                padding:  const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> Home()),
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
                              child: Image.asset('assets/images/guess.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Test Your Brain !!',
                            style: TextStyle(
                                color: Colors.green,
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
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> MainPage()),
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
                              child: Image.asset('assets/images/tic-tac-toe.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Tic Tac Toe Game',
                            style: TextStyle(
                                color: Colors.brown,
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
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=> PuzzleGetStart()),
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
                              height: 160,
                              child: Image.asset('assets/images/pz.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Sliding Puzzle',
                            style: TextStyle(
                                color: Colors.blue,
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
