import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:jogo_flutter/componentes/area_jogo.dart';

class Bola extends CircleComponent with CollisionCallbacks {
  static const raio = 10.0;

  final Vector2 velocity;

  Bola({required this.velocity, super.position})
      : super(
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
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is AreaJogo) {
      if (position.y + size.y > other.position.y + other.size.y) {
        velocity.y = -velocity.y;
      } else if (position.y < other.position.y) {
        velocity.y = -velocity.y;
      } else if (position.x + size.x > other.position.x + other.size.x) {
        velocity.x = -velocity.x;
      } else if (position.x < other.position.x) {
        velocity.x = -velocity.x;
      }
    }

  }
}
