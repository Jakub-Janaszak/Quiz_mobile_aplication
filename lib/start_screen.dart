import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  //Function() mówi, że nie przyjmuje zadnych wartosci

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(197, 255, 255, 255), //przezroczystosc
          ),
          // Opacity(
          //   opacity: 0.75,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            'Quiz about Flutter',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 232, 216, 255),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(
              Icons.keyboard_double_arrow_right_sharp,
            ),
            label: const Text(
              'Start quiz',
              //style: TextStyle(color: Color.fromARGB(255, 236, 230, 255)),
            ),
          ),
        ],
      ),
    );
  }
}
