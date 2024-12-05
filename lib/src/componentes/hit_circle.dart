import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class HitCircle extends CircleComponent {
  HitCircle({super.key})
      : super(
            radius: ballRadius,
            position: Vector2(hitPositionX, ballRadius),
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = hitColor
              ..style = PaintingStyle.stroke);
}
