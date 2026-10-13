import 'package:flutter/material.dart';
import 'package:hero_game/app/presentation/widgets/direction_pad.dart';

class MazeView extends StatefulWidget {
  const MazeView({super.key});

  @override
  State<MazeView> createState() => _MazeViewState();
}

class _MazeViewState extends State<MazeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DirectionPad(
              onDirectionPressed: (direction) {
                //debugPrint(direction.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
