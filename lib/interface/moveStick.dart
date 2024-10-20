import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MoveStick extends JoystickComponent {

  MoveStick()
      : super(
            background: CircleComponent(
                radius: 50, paint: Paint()..color = Colors.lightBlue[900]!),
            knob: CircleComponent(
                radius: 30, paint: Paint()..color = Colors.white30),
            anchor: Anchor.bottomLeft);
}
