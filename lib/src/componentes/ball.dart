import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:jogo_flutter/src/hitball_game.dart';

import '../config.dart';
import 'components.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<HitBallGame> {
  final Vector2 velocity = Vector2(-100, 0);
  bool _hit = false;
  bool _missed = false;

  Ball({super.key})
      : super(
            position: Vector2(gameWidth - 2 * ballRadius, 10),
            radius: ballRadius,
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = ballColor
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.x < hitPositionX - size.x/2 && !_hit && !_missed) {
      _missed = true;
      paint.color = Colors.red;
      game.score.value -= 1;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Hit && !_hit && !_missed) {
      _hit = true;
      game.score.value += 1;
      paint.color = Colors.green;
    } else if (other is PlayArea) {
      game.world.remove(this);
      if (game.playState == PlayState.playing) {
        game.world.add(Ball());
      } else {
        game.world.removeAll(game.world.children.query<HitCircle>());
      }
    }
  }
}
