import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:untitled_game/constants.dart';
import 'package:untitled_game/interface/mainMenu.dart';
import 'package:untitled_game/interface/moveStick.dart';
import 'package:untitled_game/interface/pause.dart';
import 'package:untitled_game/player.dart';
import 'package:untitled_game/grid.dart';

class TestGame extends FlameGame with HasCollisionDetection {
  final MoveStick moveStick = MoveStick();
  final PauseButton pauseButton = PauseButton();
  final MainMenu mainMenu = MainMenu();
  final PauseMenu pauseMenu = PauseMenu();

  final Player player = Player();

  int levelCount = 0;

  @override
  void onLoad() {
    final grid = Grid();
    world = World();
    camera = CameraComponent.withFixedResolution(
        width: fixedResolution.x, height: fixedResolution.y);
    world.add(grid);
    world.add(player);
    camera.follow(player);
    camera.viewport.add(mainMenu);
  }

  void pauseGame() {
    player.canMove = false;
    pauseButton.removeFromParent();
    moveStick.removeFromParent();
    camera.viewport.add(pauseMenu);
  }

  void quitGame() {
    pauseButton.removeFromParent();
    moveStick.removeFromParent();
    pauseMenu.removeFromParent();
    camera.viewport.add(mainMenu);
  }

  void resumeGame() {
    player.canMove = true;
    camera.viewport.remove(pauseMenu);
    add(pauseButton);
    add(moveStick);
  }

  void startGame() {
    add(pauseButton);
    add(moveStick);
    mainMenu.removeFromParent();
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.moveDirection = moveStick.delta.normalized();
  }

  static const double margin = 25;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    pauseButton.position = Vector2.all(margin);
    moveStick.position = Vector2(margin, size.y - margin);
  }

  @override
  Color backgroundColor() {
    return Colors.blueGrey[900]!;
  }
}
