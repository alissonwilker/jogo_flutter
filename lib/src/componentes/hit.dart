import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class Hit extends CircleComponent {
  Hit({super.key})
      : super(
            radius: ballRadius,
            position: Vector2(hitPositionX, ballRadius),
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = hitColor
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]) {
    add(RemoveEffect(delay: 0.15, onComplete: () {}));
  }
}
