import 'package:flutter/material.dart';
import 'package:finaltwo/puzzle_slide_game/widgets/PuzzleItem.dart';

class PuzzleGrid extends StatelessWidget {
  const PuzzleGrid({
    Key? key,
    required this.numbers,
    required this.click,
  }) : super(key: key);

  final List<int> numbers;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return Column(
      //Puzzle structure in the column (it keeps the puzzle view stable)
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
          dimension: 500,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemCount: numbers
                .length,
            itemBuilder: (context, index) => numbers[index] ==
                    0 //
                ? SizedBox.shrink()
                : PuzzleItem(
                    numbers: numbers,
                    index: index,
                    clickItem: () {
                      click(index);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
