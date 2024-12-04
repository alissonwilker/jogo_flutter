import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'componentes/hit.dart';
import 'componentes/area_jogo.dart';
import 'componentes/nota.dart';

class Jogo extends FlameGame with HasCollisionDetection, KeyboardEvents {
  static const hit1 = 'hit1';

  final ValueNotifier<int> score = ValueNotifier(0);
  
  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    debugMode = true;
    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(AreaJogo(size: size));
    world.add(Nota());
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    switch (event.logicalKey) {
      case LogicalKeyboardKey.digit1:
        if (event is KeyDownEvent) {
          var hit = Hit(key: ComponentKey.named(hit1));
          if (world.children.query<Hit>().where((hit) => hit.key == ComponentKey.named(hit1)).isEmpty) {
            world.add(hit);
          }
        }
    }
    return KeyEventResult.handled;
  }
  
}

