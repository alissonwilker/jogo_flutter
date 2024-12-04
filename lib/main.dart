import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'jogo.dart';

const jogoLargura = 1000.0;
const jogoAltura = 500.0;

void main() {
  runApp(
    FittedBox(
      child: SizedBox(
        width: jogoLargura,
        height: jogoAltura,
        child: GameWidget(
          game: Jogo()
        ),
      )
    )
  );
}
