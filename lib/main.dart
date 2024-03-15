import 'package:flutter/material.dart';

import 'package:tic_tac_toe_app/screens/splash_screen.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      home: SplashScreen(),
    );
  }
}
