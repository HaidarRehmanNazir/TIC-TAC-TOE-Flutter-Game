import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe_app/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 255, 238),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Tic Tac Toe',
              style: GoogleFonts.lobster(fontSize: 40, color: Colors.red),
            ),
            Lottie.asset('assets/animations/toe-anim.json'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 66, 66, 66)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Start the Game',
                    style: GoogleFonts.lobster(color: Colors.red),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
