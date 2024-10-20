
import 'dart:math';

import 'package:flame/components.dart';

const double tileSize = 20;

final Vector2 fixedResolution = Vector2.all(220);

final Vector2 upVector = Vector2(0, -tileSize);
final Vector2 rightVector = Vector2(tileSize, 0);
final Vector2 downVector = Vector2(0, tileSize);
final Vector2 leftVector = Vector2(-tileSize, 0);

const double upAngle = 0;
const double rightAngle = pi / 2;
const double downAngle = pi;
const double leftAngle = -pi / 2;