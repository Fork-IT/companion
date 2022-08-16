import 'package:flutter/material.dart';

class PuzzleItem extends StatelessWidget {
  const PuzzleItem({
    Key? key,
    required this.numbers,
    required this.index,
    required this.clickItem,
  }) : super(key: key);

  final List<int> numbers;
  final int index;
  final Function() clickItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      //Card for shadow and padding adjustment
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      child: InkWell(
        //Provides water drop effect to pressureyor
        onTap: clickItem, //it tells here what happens when you click it
        child: Container(
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            //the text to be found in the puzzle elements
            "${numbers[index]}",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
    );
  }
}
