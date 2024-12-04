import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'componentes/area_jogo.dart';
import 'componentes/bola.dart';

class Jogo extends FlameGame with HasCollisionDetection, KeyboardEvents {
  static const bola1 = 'bola1';

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    debugMode = true;
    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(AreaJogo(size: size));
    world.add(Bola(velocity: Vector2(size.x / 5, size.y / 2)));
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    switch (event.logicalKey) {
      case LogicalKeyboardKey.digit1:
        if (event is KeyDownEvent) {
          world.add(Bola(key: ComponentKey.named(bola1), velocity: Vector2.zero()));
        } else if (event is KeyUpEvent) {
          world.removeWhere((elem) => elem.key == ComponentKey.named(bola1));
        }
    }
    return KeyEventResult.handled;
  }
  
}

