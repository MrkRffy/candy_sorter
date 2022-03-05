import 'package:candy_sorter/features/candy_sorter/model/model.dart';
import 'package:candy_sorter/features/candy_sorter/view/bowl_area.dart';
import 'package:candy_sorter/features/candy_sorter/view/candy_area.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Game game;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _createGame();
  }

  _createGame() {
    game = Game(
      colors: [
        Colors.red,
        Colors.green,
        Colors.blueGrey,
        Colors.cyan,
        Colors.orange,
      ],
      numberOfCandies: 2,
      gameArea: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height / 2,
      ),
    );
    setState(() {});
  }

  /// Call this when you put a candy into the bowl.
  void _onRemoveCandy(Candy candy) {
    game.removeCandy(candy);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ElevatedButton(
                onPressed: _createGame,
                child: const Text('New Game'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Candies left: ${game.candies.length}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Candies sorted: ${game.sortedCandiesCount}',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
              ),
              Expanded(
                child: BowlArea(
                  game: game,
                  onRemoveCandy: _onRemoveCandy,
                ),
              ),
            ],
          ),
          CandyArea(
            game: game,
          ),
        ],
      ),
    );
  }
}
