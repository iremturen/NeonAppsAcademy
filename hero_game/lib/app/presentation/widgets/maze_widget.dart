import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hero_game/app/common/constants/colors.dart';
import 'package:hero_game/app/common/constants/dimensions.dart';
import 'package:hero_game/app/common/constants/direction.dart';

class MazeWidget extends StatelessWidget {
  final List<Direction> directions;
  final int currentStep;

  const MazeWidget({
    super.key,
    this.directions = mazePath,
    this.currentStep = 0,
  });

  @override
  Widget build(BuildContext context) {
    const rooms = AppDimensions.mazeGridSize;
    const blocks = rooms * 2 + 1;
    final route = _calculateRoute(directions);
    if (route.isEmpty) return const SizedBox.shrink();

    final playerBlock =
        currentStep >= directions.length && directions.isNotEmpty
        ? _finishBlock(route.last, directions.last)
        : _roomBlock(route[currentStep.clamp(0, route.length - 1).toInt()]);

    return AspectRatio(
      aspectRatio: AppDimensions.mazeAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cellSize = constraints.maxWidth / blocks;
          return Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: MazePainter(directions: directions),
                child: const SizedBox.expand(),
              ),
              Positioned(
                left: playerBlock.x * cellSize,
                top: playerBlock.y * cellSize,
                width: cellSize,
                height: cellSize,
                child: Center(
                  child: Hero(
                    tag: 'maze-player',
                    child: Container(
                      width: cellSize * AppDimensions.mazePlayerSizeFactor,
                      height: cellSize * AppDimensions.mazePlayerSizeFactor,
                      decoration: const BoxDecoration(
                        color: AppColor.lightBlue,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.lightBlue,
                            blurRadius: 12,
                            spreadRadius: 3,
                          ),
                          BoxShadow(
                            color: AppColor.blue,
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Point<int>> _calculateRoute(List<Direction> directions) {
  const rooms = AppDimensions.mazeGridSize;
  final route = <Point<int>>[Point(rooms ~/ 2 + 1, rooms - 1)];

  for (final direction in directions) {
    final next = _nextCell(route.last, direction);
    if (next.x < 0 || next.x >= rooms || next.y < 0 || next.y >= rooms) {
      return [];
    }
    route.add(next);
  }

  return route;
}

Point<int> _nextCell(Point<int> current, Direction direction) {
  switch (direction) {
    case Direction.up:
      return Point(current.x, current.y - 1);
    case Direction.down:
      return Point(current.x, current.y + 1);
    case Direction.left:
      return Point(current.x - 1, current.y);
    case Direction.right:
      return Point(current.x + 1, current.y);
  }
}

Point<int> _roomBlock(Point<int> room) => Point(1 + 2 * room.x, 2 + 2 * room.y);

Point<int> _finishBlock(Point<int> room, Direction direction) {
  final opening = _openingBlock(room, direction);
  return direction == Direction.up && room.y == 0
      ? Point(opening.x, 0)
      : opening;
}

Point<int> _openingBlock(Point<int> room, Direction direction) {
  final bx = 1 + 2 * room.x;
  final by = 2 + 2 * room.y;

  return switch (direction) {
    Direction.up => Point(bx, by - 1),
    Direction.down => Point(bx, by + 1),
    Direction.left => Point(bx - 1, by),
    Direction.right => Point(bx + 1, by),
  };
}

class MazePainter extends CustomPainter {
  final List<Direction> directions;

  const MazePainter({required this.directions});

  @override
  void paint(Canvas canvas, Size size) {
    if (directions.isEmpty) return;

    const rooms = AppDimensions.mazeGridSize;
    const blocks = rooms * 2 + 1;

    final cellW = size.width / blocks;
    final cellH = size.height / blocks;

    final route = _calculateRoute(directions);
    if (route.isEmpty) return;

    final open = List.generate(blocks, (_) => List.filled(blocks, false));

    void carveRoom(Point<int> p) {
      open[2 + 2 * p.y][1 + 2 * p.x] = true;
    }

    void carveEdge(Point<int> a, Point<int> b) {
      open[a.y + b.y + 2][a.x + b.x + 1] = true;
    }

    carveRoom(route.first);
    for (var i = 0; i < route.length - 1; i++) {
      carveRoom(route[i + 1]);
      carveEdge(route[i], route[i + 1]);
    }

    final exitBlock = _openingBlock(route.last, directions.last);
    final finishBlock = _finishBlock(route.last, directions.last);

    open[exitBlock.y][exitBlock.x] = true;
    open[finishBlock.y][finishBlock.x] = true;

    final wallPaint = Paint()
      ..color = AppColor.mazeWall
      ..style = PaintingStyle.fill;

    final pathPaint = Paint()
      ..color = AppColor.mazePath
      ..style = PaintingStyle.fill;

    final gridPaint = Paint()
      ..color = AppColor.mazeGrid
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppDimensions.mazeGridStrokeWidth;

    canvas.drawRect(Offset.zero & size, wallPaint);

    for (var y = 0; y < blocks; y++) {
      for (var x = 0; x < blocks; x++) {
        if (!open[y][x]) continue;

        final rect = Rect.fromLTWH(x * cellW, y * cellH, cellW, cellH);
        canvas.drawRect(rect, pathPaint);
        canvas.drawRect(rect, gridPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant MazePainter oldDelegate) {
    return !listEquals(oldDelegate.directions, directions);
  }
}
