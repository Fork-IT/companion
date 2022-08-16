import 'package:flutter/material.dart';

class AnalyticsRow extends StatelessWidget {
  const AnalyticsRow({
    Key? key,
    required this.move,
    required this.secondsPassed,
  }) : super(key: key);

  final int move;
  final int secondsPassed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60,bottom: 90),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Moves : $move",
            style: TextStyle(
              fontFamily: "DynaPuff",
              fontSize: 20,
            ),
          ),
          Text(
            "Time : ${secondsPassed} Sec",
            style: TextStyle(
              fontFamily: "DynaPuff",
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
