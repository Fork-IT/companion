import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:finaltwo/puzzle_slide_game/widgets/AnalyticsRow.dart';
import 'package:finaltwo/puzzle_slide_game/widgets/PuzzleGrid.dart';



class PuzzleStart extends StatelessWidget {
  const PuzzleStart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        //luminous theme
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white70,
        ),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        //dark theme
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
        ),
        cardColor: Colors.green.shade800,
      ),
      debugShowCheckedModeBanner: false,
      home: PuzzleHome(),
    );
  }
}



class PuzzleHome extends StatefulWidget {
  const PuzzleHome({Key? key}) : super(key: key);

  @override
  State<PuzzleHome> createState() => _PuzzleHomeState();
}

class _PuzzleHomeState extends State<PuzzleHome> {
  //Numbers that will appear on the screen
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  //variable that holds how many moves we use
  var move = 0;

  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    numbers.shuffle(); //Method that shuffles array of numbers at application startup
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        startTime();
      });
    }
    return Scaffold(
      backgroundColor: Colors.cyan.shade700,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 25,
        title: Text(
          "Puzzle",
          style: TextStyle(fontSize: 29,
          fontFamily: "Merriweather"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                reset();
              });
            },
            icon: Icon(Icons.loop),
          ),
        ],
      ),
      body: ListView(
        children: [
          AnalyticsRow(
            move: move,
            secondsPassed: secondsPassed,
          ),
          PuzzleGrid(
            numbers: numbers,
            click: clickGrid,
          ),
        ],
      ),
    );
  }

  void clickGrid(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        (index - 4 >= 0 && numbers[index - 4] == 0) ||
        (index + 4 < 16 && numbers[index + 4] == 0)) {
      setState(() {
        move++;
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
      });
    }
    checkWin();
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Whoaa !! You Won.",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 220.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      );
    }
  }
}
