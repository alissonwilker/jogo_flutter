import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class AreaJogo extends RectangleComponent {
  AreaJogo({required super.size})
      : super(
            paint: Paint()..color = const Color.fromARGB(241, 42, 230, 167),
            children: [RectangleHitbox()]);
}
