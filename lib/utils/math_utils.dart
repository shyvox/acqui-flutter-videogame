import 'dart:math';
import 'package:flame/extensions.dart';
double screenSize = 1600;
double getAngle(Vector2 origin, Vector2 target) {

  double dx = target.x - origin.x;
  double dy = -(target.y - origin.y);

  double angleInRadians = atan2(dy, dx);

  if (angleInRadians < 0) {
    angleInRadians = angleInRadians.abs();
  }
  else {
    angleInRadians = 2 * pi - angleInRadians;
  }

  return angleInRadians * radians2Degrees;
}

Rect getGameScreenBounds(Vector2 canvasSize) {
  double left = 0, right = 0, top = 0, bottom = 0;

  if (canvasSize.x > screenSize) {
    left = (canvasSize.x - screenSize) / 2;
  }
  if (canvasSize.y > screenSize) {
    top = (canvasSize.y - screenSize) / 2;
  }

  if (canvasSize.x < screenSize) {
    right = canvasSize.x;
  } else {
    right = left + screenSize;
  }

  if (canvasSize.y < screenSize) {
    bottom = canvasSize.y;
  } else {
    bottom = top + screenSize;
  }

  return Rect.fromLTRB(left, top, right, bottom);
}