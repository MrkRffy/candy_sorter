import 'package:candy_sorter/features/candy_sorter/model/model.dart';
import 'package:candy_sorter/features/candy_sorter/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CandyArea extends StatefulWidget {
  const CandyArea({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  State<CandyArea> createState() => _CandyAreaState();
}

class _CandyAreaState extends State<CandyArea> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Stack(
          children: [
            for (var candy in widget.game.candies)
              Positioned(
                top: candy.top,
                left: candy.left,
                child: Draggable(
                  data: candy,
                  feedback: CandyWidget(candy: candy),
                  child: CandyWidget(candy: candy),
                  childWhenDragging: Container(),
                  onDraggableCanceled: (velocity, offset) {
                    print("Canceled");
                    setState(
                      () {
                        double top = offset.dy;
                        double left = offset.dx;

                        // Avoid candy over header.
                        if (top < 90) {
                          top = 90;
                        }

                        // Avoid candy over bowls
                        if (top > widget.game.gameArea.height) {
                          top = widget.game.gameArea.height;
                        }

                        candy.top = top - 28;
                        candy.left = left;
                      },
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
