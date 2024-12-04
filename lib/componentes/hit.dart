import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../jogo.dart';
import 'nota.dart';

class Hit extends CircleComponent with CollisionCallbacks, HasGameReference<Jogo> {
    bool _hit = false;

    Hit({super.key})
      : super(
          radius: 10,
          position: Vector2(200, 10),
          anchor: Anchor.topLeft,
          paint: Paint()
            ..color = const Color.fromARGB(255, 57, 145, 30)
            ..style = PaintingStyle.fill,
            children: [CircleHitbox()]
        ) {
            add(RemoveEffect(
            delay: 0.15,
            onComplete: () {
              if (!_hit) {
                game.score.value -= 1;
              }
            }));
        }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
      if (other is Nota) {
        _hit = true;
      }
    }

}