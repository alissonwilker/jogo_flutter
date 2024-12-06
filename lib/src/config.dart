import 'package:flutter/material.dart';

// dimension
const gameWidth = 500.0;
const gameHeight = 250.0;
const ballRadius = gameWidth * 0.02;
const hitPositionX = gameWidth / 4;

// color
const gameBackgroundColor = Color.fromARGB(255, 242, 232, 207);
const hitColor = Color.fromARGB(255, 30, 145, 70);
const ballColor = Color.fromARGB(255, 30, 96, 145);
const ballMissedColor = Colors.red;
const playAreaColor = Color.fromARGB(255, 183, 239, 238);

// key
const hitKey = 'hitKey';

// speed
const hitCircleStep = gameHeight/50;
const ballStep = gameWidth/5;
