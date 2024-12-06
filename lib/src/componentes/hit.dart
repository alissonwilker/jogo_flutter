import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:jogo_flutter/src/componentes/hit_circle.dart';

import '../config.dart';
import '../hitball_game.dart';

class Hit extends CircleComponent with HasGameReference<HitBallGame> {
  Hit({super.key})
      : super(
            radius: ballRadius,
            anchor: Anchor.topLeft,
            paint: Paint()
              ..color = hitColor
              ..style = PaintingStyle.fill,
            children: [CircleHitbox()]) {
    add(RemoveEffect(delay: 0.15, onComplete: () {}));
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    position = game.world.children.query<HitCircle>().first.position;
  }
}
