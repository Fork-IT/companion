import 'package:flutter/material.dart';
import 'package:finaltwo/chess/models/board.dart';
import 'package:finaltwo/chess/models/half_move.dart';
import 'package:finaltwo/chess/models/short_move.dart';
import 'package:finaltwo/chess/models/square.dart';
import 'package:finaltwo/chess/widgets/ui_piece.dart';
import 'package:finaltwo/chess/widgets/ui_tile.dart';
import 'package:fpdart/fpdart.dart';
import 'package:provider/provider.dart';

class UISquare extends StatelessWidget {
  final Square square;
  final void Function(ShortMove move) onDrop;
  final void Function(HalfMove move) onClick;
  final Color? highlight;

  UISquare({
    required this.square,
    required this.onClick,
    required this.onDrop,
    this.highlight,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: square.x,
      top: square.y,
      width: square.size,
      height: square.size,
      child: _buildSquare(context),
    );
  }

  Widget _buildSquare(BuildContext context) {
    final board = Provider.of<Board>(context);
    return DragTarget<HalfMove>(
      onWillAccept: (data) {
        return data?.square != square.name;
      },
      onAccept: (data) {
        onDrop(ShortMove(
          from: data.square,
          to: square.name,
        ));
      },
      builder: (context, candidateData, rejectedData) {
        return InkWell(
          onTap: () => onClick(HalfMove(square.name, square.piece)),
          child: Stack(
            children: [
              UITile(
                color: square.color,
                size: square.size,
              ),
              if (highlight != null)
                Container(
                  color: highlight,
                  height: square.size,
                  width: square.size,
                ),
              board.buildCustomPiece
                  .flatMap((t) => Option.fromNullable(t(square)))
                  .alt(() => square.piece.map((t) => UIPiece(
                        squareName: square.name,
                        squareColor: square.color,
                        piece: t,
                        size: square.size,
                      )))
                  .getOrElse(() => SizedBox())
            ],
          ),
        );
      },
    );
  }
}
