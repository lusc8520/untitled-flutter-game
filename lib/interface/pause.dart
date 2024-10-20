import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/layout.dart';
import 'package:flutter/material.dart';
import 'package:untitled_game/constants.dart';
import 'package:untitled_game/game.dart';

class PauseButton extends ButtonComponent with HasGameReference<TestGame> {

  @override
  void onMount() {
    final circle =
        CircleComponent(radius: 25, paint: Paint()..color = Colors.black);
    size = circle.size;
    button = circle;
    super.onMount();
    onPressed = game.pauseGame;
  }
}

class PauseMenu extends RectangleComponent with HasGameReference<TestGame> {
  @override
  void onLoad() {
    size = fixedResolution;
    paint = Paint()..color = Colors.black;
    add(AlignComponent(
        child: PositionComponent(children: [
          TextComponent(
              text: "Pause",
              anchor: Anchor.center,
              textRenderer: TextPaint(style: const TextStyle(fontSize: 30))),
          ButtonComponent(
              anchor: Anchor.center,
              button: TextComponent(
                  text: "Resume Game",
                  textRenderer:
                      TextPaint(style: const TextStyle(fontSize: 20))),
              position: Vector2(0, 70),
              onPressed: game.resumeGame),
        ], size: Vector2(0, 120)),
        alignment: Anchor.center));
  }
}
