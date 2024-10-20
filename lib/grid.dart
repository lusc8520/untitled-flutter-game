import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Grid extends PositionComponent {
  @override
  void onLoad() {
    final innerPaint = Paint()..color = Colors.blueGrey[700]!;
    final outerPaint = Paint()..color = Colors.blueGrey[800]!;

    final size = 10;

    for (var x = 0; x < size; x++) {
      for (var y = 0; y < size; y++) {
        final tile = PositionComponent(children: [
          RectangleComponent(
              size: Vector2.all(20), anchor: Anchor.center, paint: outerPaint),
          RectangleComponent(
              size: Vector2.all(18), anchor: Anchor.center, paint: innerPaint)
        ], position: Vector2(x * 20, y * 20));
        add(tile);
      }
    }

    final wallPaint = Paint()..color = Colors.black;
    for (var x = -1; x <= size; x++) {
      for (var y = -1; y <= size; y++) {
        if (x == -1 || y == -1 || x == size || y == size) {
          final tile = RectangleComponent(
              size: Vector2.all(20),
              anchor: Anchor.center,
              paint: wallPaint,
              position: Vector2(x * 20, y * 20));
          add(tile);
        }
      }
    }
  }
}
