import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import 'components.dart';

class HitCircle extends CircleComponent with CollisionCallbacks {
  HitCircle({super.key})
      : super(
            radius: ballRadius,
            position: Vector2(hitPositionX, gameHeight/2 - ballRadius),
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = hitColor
              ..style = PaintingStyle.stroke,
            children: [CircleHitbox()]);

  void moveDown() {
     if (position.y < gameHeight - size.y) {
      add(MoveByEffect(Vector2(0, hitCircleStep), CurvedEffectController(1, Curves.easeIn)));
     }
  }

  void moveUp() {
    if (position.y > 0)  {
      add(MoveByEffect(Vector2(0, -hitCircleStep), CurvedEffectController(1, Curves.easeIn)));
    }
  } 

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is PlayArea) {
      removeAll(children.query<MoveByEffect>());
    }
  }
}
