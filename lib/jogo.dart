import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'componentes/area_jogo.dart';
import 'componentes/bola.dart';
import 'constantes.dart';

class Jogo extends FlameGame {

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();

    debugMode = true;

    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(AreaJogo(areaJogoComprimento, areaJogoAltura));
    world.add(Bola(velocidade: Vector2(100, 100), position: Vector2(100, 100)));
  }
  
}

