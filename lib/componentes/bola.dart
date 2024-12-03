import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Bola extends CircleComponent {
  Bola({required this.velocidade, required super.position})
      : super(
          radius: 10,
          anchor: Anchor.center,
          paint: Paint()
            ..color = const Color(0xff1e6091)
            ..style = PaintingStyle.fill,
        );

  final Vector2 velocidade;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocidade * dt;
  }
}
