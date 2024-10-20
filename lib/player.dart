import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent {
  double lookDirection = 0;

  Vector2 moveDirection = Vector2.zero();

  double moveSpeed = 20;
  bool canMove = true;

  @override
  void onLoad() {

    var outline = CircleComponent(
      priority: 1,
        radius: 6, anchor: Anchor.bottomCenter, paint: Paint()..color = Colors.black);
    var circle = CircleComponent(radius: 5, anchor: Anchor.bottomCenter, priority: 1, position: Vector2(0, -1), paint: Paint()..color = Colors.lightBlue);
    var pointer = CircleComponent(
        radius: 3,
        paint: Paint()..color = Colors.red,
        anchor: Anchor.center,
        position: Vector2(0, -5));
    var shadow = CircleComponent(
        radius: 5,
        scale: Vector2(1, 0.5),
        anchor: Anchor.center,
        paint: Paint()
          ..color = Colors.black45);

    addAll([outline, circle, pointer, shadow ]);
  }


  @override
  void update(double dt) {

    if (canMove) {
      position += moveDirection * moveSpeed * dt;
    }
  }

}
