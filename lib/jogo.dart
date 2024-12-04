import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'componentes/area_jogo.dart';
import 'componentes/bola.dart';

class Jogo extends FlameGame with HasCollisionDetection {
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    debugMode = true;
    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(AreaJogo(size: size));
    world.add(Bola(velocity: Vector2(size.x / 5, size.y / 2)));
  }
  
}

