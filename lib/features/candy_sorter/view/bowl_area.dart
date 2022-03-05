import 'package:candy_sorter/features/candy_sorter/model/model.dart';
import 'package:candy_sorter/features/candy_sorter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BowlArea extends StatelessWidget {
  const BowlArea({
    Key? key,
    required this.game,
    this.onRemoveCandy,
  }) : super(key: key);

  final Game game;
  final Function(Candy)? onRemoveCandy;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < game.colors.length; i++)
          DragTarget<Candy>(
            builder: (context, candidateData, rejectedData) => Bowl(
              color: game.colors[i],
            ),
            onAccept: (candy) {
              if (candy.color == game.colors[i]) {
                onRemoveCandy?.call(candy);
              }
            },
          )
      ],
    );
  }
}
