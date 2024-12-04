import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class AreaJogo extends RectangleComponent {
  AreaJogo({required super.size})
      : super(
            paint: Paint()..color = const Color.fromARGB(240, 227, 230, 42),
            children: [RectangleHitbox()]);
}
