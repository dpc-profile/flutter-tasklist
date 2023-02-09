import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int levelDifficulty;

  const Difficulty({Key? key, required this.levelDifficulty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 15,
            color: (levelDifficulty >= 1)
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (levelDifficulty >= 2)
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (levelDifficulty >= 3)
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (levelDifficulty >= 4)
                ? Colors.blue
                : Colors.blue[100]),
        Icon(Icons.star,
            size: 15,
            color: (levelDifficulty >= 5)
                ? Colors.blue
                : Colors.blue[100]),
      ],
    );
  }
}
