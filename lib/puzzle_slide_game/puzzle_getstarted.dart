import 'package:finaltwo/puzzle_slide_game/home_page.dart';
import 'package:flutter/material.dart';


class PuzzleGetStart extends StatefulWidget {
  const PuzzleGetStart({Key? key}) : super(key: key);

  @override
  State<PuzzleGetStart> createState() => _PuzzleGetStartState();
}

class _PuzzleGetStartState extends State<PuzzleGetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:100),
                    child: Text(
                      "Sliding Puzzle",
                      style: TextStyle(
                        fontFamily: "DynaPuff",
                        color: Colors.blue,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(horizontal:32 ),
                  ),
                  Text(
                    "Skill Game Where You Are the Doctor !!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "\nThe solution often turns out more beautiful than the puzzle.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      color: Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "\n* Put the pieces of the puzzle together in order to \nsee the big picture.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Merriweather",
                      color: Colors.red,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
          ),
          Container(
            padding: EdgeInsets.symmetric(),
            child: Center(
              child: Image.asset("assets/images/sliding.png"),
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PuzzleStart()),);
              },
              child: Container(
                margin: EdgeInsets.all(32),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFB40284A)
                ),
                child: Center(
                  child: Text(
                    "Let the Game begin !!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}