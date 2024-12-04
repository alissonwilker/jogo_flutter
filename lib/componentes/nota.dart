import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:jogo_flutter/componentes/area_jogo.dart';
import 'package:jogo_flutter/componentes/hit.dart';
import 'package:jogo_flutter/jogo.dart';

class Nota extends CircleComponent with CollisionCallbacks, HasGameReference<Jogo> {
  static const raio = 10.0;

  final Vector2 velocity = Vector2(-100, 0);
  bool _hit = false;
  bool _missed = false;

  Nota({super.key})
      : super(
          position: Vector2(500, 10),
          radius: raio,
          anchor: Anchor.topLeft,
          paint: Paint()
            ..color = const Color(0xff1e6091)
            ..style = PaintingStyle.fill,
            children: [CircleHitbox()]
        );

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.x < 200 - size.x && !_hit && !_missed) { 
      _missed = true;
      paint.color = Colors.red;
      game.score.value -= 1;
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Hit && !_hit) {
      _hit = true;
      game.score.value += 1;
      paint.color = Colors.green;
    } else if (other is AreaJogo) {
      game.world.remove(this);
      game.world.add(Nota());
    }
  }

}
