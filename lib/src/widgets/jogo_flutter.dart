import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';
import '../jogo.dart';
import 'overlay_screen.dart';
import 'score_card.dart';

class JogoFlutter extends StatefulWidget {
  const JogoFlutter({super.key});

  @override
  State<JogoFlutter> createState() => _JogoFlutterState();
}

class _JogoFlutterState extends State<JogoFlutter> {
  late final Jogo jogo;

  @override
  void initState() {
    super.initState();
    jogo = Jogo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.pressStart2pTextTheme().apply(
              bodyColor: const Color.fromARGB(255, 24, 78, 119),
              displayColor: const Color.fromARGB(255, 24, 78, 119)),
        ),
        home: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xffa9d6e5),
                      Color(0xfff2e8cf),
                    ],
                  ),
                ),
                child: SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                            child: Column(children: [
                          ScoreCard(score: jogo.score),
                          Expanded(
                              child: FittedBox(
                                  child: SizedBox(
                            width: gameWidth,
                            height: gameHeight,
                            child: GameWidget(game: jogo, overlayBuilderMap: {
                              PlayState.welcome.name: (context, game) =>
                                  const OverlayScreen(
                                    title: 'JOGAR',
                                    subtitle: 'Aperte 1 para acertar a nota',
                                  ),
                              PlayState.gameOver.name: (context, game) =>
                                  const OverlayScreen(
                                    title: 'FIM',
                                    subtitle: 'Aperte 1 para acertar a nota',
                                  ),
                              PlayState.won.name: (context, game) =>
                                  const OverlayScreen(
                                    title: 'PARABÉNS',
                                    subtitle: 'Aperte 1 para acertar a nota',
                                  ),
                            }),
                          )))
                        ])))))));
  }
}
