import 'dart:math' as math;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:jogo_flutter/src/hitball_game.dart';

import '../config.dart';
import 'components.dart';

class Ball extends CircleComponent
    with CollisionCallbacks, HasGameReference<HitBallGame> {
  final random = math.Random();
  final fadeInEffect = OpacityEffect.fadeIn(LinearEffectController(2));
  final fadeOutEffect = OpacityEffect.fadeOut(LinearEffectController(1));
  late final Vector2 velocity;

  bool _hit = false;
  bool _missed = false;

  Ball({super.key})
      : super(
            radius: ballRadius,
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = ballColor
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]) {

    position = Vector2(gameWidth - 2 * ballRadius, random.nextInt((gameHeight - size.y).toInt()).toDouble());
    velocity = Vector2(- (ballStep + (ballStep * ballStepVariation) * random.nextDouble()), 0);
    opacity = 0;
    add(fadeInEffect);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (position.x < hitPositionX - size.x / 2) {
      if (opacity == 1) {
        add(fadeOutEffect);
      }
      if (!_hit && !_missed) {
        _missed = true;
        paint.color = ballMissedColor;
        game.score.value -= 1;
      }
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
      removeFromParent();
      if (game.playState == PlayState.playing) {
        game.world.add(Ball());
      } else {
        game.world.removeAll(game.world.children.query<HitCircle>());
      }
    }
  }
}
