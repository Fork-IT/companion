import 'package:finaltwo/match_pair/MatchPair.dart';
import 'package:finaltwo/memory_game/screen/home.dart';
import 'package:finaltwo/pages/splash.dart';
import 'package:finaltwo/tic_tac_toe/tic_tac_screen.dart';
import 'package:flutter/material.dart';


class GameDashboard extends StatelessWidget {
  const GameDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[500]!,
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
                          builder: (context)=> splashscreen()),
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
                              child: Image.asset('assets/quiz.png',)

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
                              child: Image.asset('assets/images/memory.png',)

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
                              height: 160,
                              child: Image.asset('assets/images/sl.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Snakes & Ladders',
                            style: TextStyle(
                                color: Colors.black,
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
                              height: 160,
                              child: Image.asset('assets/images/chess.png',)

                          ),
                          const Spacer(),
                          const Text(
                            'Chess Titans',
                            style: TextStyle(
                                color: Colors.black,
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
