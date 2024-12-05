import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:jogo_flutter/src/componentes/play_area.dart';
import 'package:jogo_flutter/src/componentes/hit.dart';
import 'package:jogo_flutter/src/jogo.dart';

import '../config.dart';

class Nota extends CircleComponent
    with CollisionCallbacks, HasGameReference<Jogo> {
  final Vector2 velocity = Vector2(-100, 0);
  bool _hit = false;
  bool _missed = false;

  Nota({super.key})
      : super(
            position: Vector2(gameWidth - 2 * notaRaio, 10),
            radius: notaRaio,
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = notaColor
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]);

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.x < hitLimit - size.x && !_hit && !_missed) {
      _missed = true;
      paint.color = Colors.red;
      game.score.value -= 1;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Hit && !_hit) {
      _hit = true;
      game.score.value += 1;
      paint.color = Colors.green;
    } else if (other is PlayArea) {
      game.world.remove(this);
      if (game.playState == PlayState.playing) {
        game.world.add(Nota());
      }
    }
  }
}
