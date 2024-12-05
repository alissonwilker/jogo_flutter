import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'componentes/components.dart';
import 'config.dart';

enum PlayState { welcome, playing, gameOver, won }

class Jogo extends FlameGame
    with HasCollisionDetection, KeyboardEvents {
  Jogo()
      : super(
          camera: CameraComponent.withFixedResolution(
            width: gameWidth,
            height: gameHeight,
          ),
        );

  final ValueNotifier<int> score = ValueNotifier(0);
  double get width => size.x;
  double get height => size.y;

  late PlayState _playState;

  PlayState get playState => _playState;
  set playState(PlayState playState) {
    _playState = playState;
    switch (playState) {
      case PlayState.welcome:
      case PlayState.gameOver:
      case PlayState.won:
        overlays.add(playState.name);
      case PlayState.playing:
        overlays.remove(PlayState.welcome.name);
        overlays.remove(PlayState.gameOver.name);
        overlays.remove(PlayState.won.name);
    }
  }

  @override
  FutureOr<void> onLoad() async {
    super.onLoad();
    //debugMode = true;
    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());

    score.addListener(() {
      if (score.value < 0) {
        playState = PlayState.gameOver;
      } else if (score.value > 2) {
        playState = PlayState.won;
      }
    });

    playState = PlayState.welcome;
  }

  void gameFinished(PlayState state) {
    playState = state;
  }

  void startGame() {
    if (playState == PlayState.playing) return;

    world.removeAll(world.children.query<Nota>());
    world.removeAll(world.children.query<Hit>());

    playState = PlayState.playing;
    score.value = 0;
    
    world.add(Nota());
    world.add(HitCircle());
  }

  @override
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    super.onKeyEvent(event, keysPressed);

    switch (event.logicalKey) {
      case LogicalKeyboardKey.digit1:
        if (event is KeyDownEvent) {
          if (playState == PlayState.playing) {
          var hit = Hit(key: ComponentKey.named(hitKey));
            if (world.children
                .query<Hit>()
                .where((hit) => hit.key == ComponentKey.named(hitKey))
                .isEmpty) {
              world.add(hit);
            }
          } else {
            startGame();
          }

        }
    }
    return KeyEventResult.handled;
  }

  @override
  Color backgroundColor() => jogoBackgroundColor;
}
