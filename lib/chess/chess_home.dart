import 'dart:math';

import 'package:finaltwo/chess/widgets/chessboard.dart';
import 'package:flutter/material.dart';
import 'models/board_color.dart';
import 'utils (2).dart';

class ChessHome extends StatefulWidget {
  @override
  _ChessHomeState createState() => _ChessHomeState();
}

class _ChessHomeState extends State<ChessHome> {
  String _fen = 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1';

  @override
  Widget build(BuildContext context) {
    final viewport = MediaQuery.of(context).size;
    final size = min(viewport.height, viewport.width);

    return Scaffold(
      appBar: AppBar(
        title: Text("Chess Titans"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        elevation: 25,
      ),
      body: Center(
        child: Chessboard(
          fen: _fen,
          size: size,
          orientation: BoardColor.WHITE,
          onMove: (move) {
            final nextFen = makeMove(_fen, {
              'from': move.from,
              'to': move.to,
              'promotion': 'q',
            });

            if (nextFen != null) {
              setState(() {
                _fen = nextFen;
              });

              Future.delayed(Duration(milliseconds: 300)).then((_) {
                final nextMove = getRandomMove(_fen);

                if (nextMove != null) {
                  setState(() {
                    _fen = makeMove(_fen, nextMove) ?? _fen;
                  });
                }
              });
            }
          },
        ),
      ),
    );
  }
}