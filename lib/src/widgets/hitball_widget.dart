import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config.dart';
import '../hitball_game.dart';
import 'overlay_screen.dart';
import 'score_card.dart';

class HitBallGameWidget extends StatefulWidget {
  const HitBallGameWidget({super.key});

  @override
  State<HitBallGameWidget> createState() => _HitBallGameWidgetState();
}

class _HitBallGameWidgetState extends State<HitBallGameWidget> {
  late final HitBallGame game;

  @override
  void initState() {
    super.initState();
    game = HitBallGame();
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
                          ScoreCard(score: game.score),
                          Expanded(
                              child: FittedBox(
                                  child: SizedBox(
                            width: gameWidth,
                            height: gameHeight,
                            child: GameWidget(game: game, overlayBuilderMap: {
                              PlayState.welcome.name: (context, game) =>
                                  const OverlayScreen(
                                    title: 'JOGAR',
                                    subtitle: 'Pressione 1',
                                  ),
                              PlayState.gameOver.name: (context, game) =>
                                  const OverlayScreen(
                                    title: 'FIM',
                                    subtitle: 'Pressione 1',
                                  ),
                              PlayState.won.name: (context, game) =>
                                  const OverlayScreen(
                                    title: 'PARABÉNS!',
                                    subtitle: 'Pressione 1',
                                  ),
                            }),
                          )))
                        ])))))));
  }
}
