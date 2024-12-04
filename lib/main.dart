import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'jogo.dart';
import 'widgets/score_card.dart';

const jogoLargura = 1000.0;
const jogoAltura = 500.0;

final jogo = Jogo();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        body:Column(
          children: [
            ScoreCard(score: jogo.score),
            FittedBox(
              child: SizedBox(
                width: jogoLargura,
                height: jogoAltura,
                child: GameWidget(
                  game: jogo
                ),
              )
            )
          ]
        )
      )
    )
  );
}
