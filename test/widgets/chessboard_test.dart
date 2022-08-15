import 'package:finaltwo/chess/widgets/chessboard.dart';
import 'package:flutter/material.dart';
import 'package:finaltwo/chess/flutter_stateless_chessboard.dart';
import 'package:finaltwo/chess/widgets/ui_square.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Chessboard', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Chessboard(
          fen: 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',
          size: 400,
        ),
      ),
    ));

    final squaresFinder = find.byType(UISquare);

    expect(squaresFinder, findsNWidgets(64));
  });
}
