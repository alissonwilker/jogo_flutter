import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class HitCircle extends CircleComponent {
  HitCircle({super.key})
      : super(
            radius: notaRaio,
            position: Vector2(hitPositionX, notaRaio),
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = hitColor
              ..style = PaintingStyle.stroke);
}
