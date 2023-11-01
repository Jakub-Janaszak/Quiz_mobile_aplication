import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kurs_2_flutter_quiz/answer_button.dart';
import 'package:kurs_2_flutter_quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      widget.onSelectAnswer(answer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.openSans(
                color: const Color.fromARGB(255, 238, 213, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //mapowanie listy stringów na przyciski odpowiedzi
            ...currentQuestion.shuffledAnswers.map((answerXD) {
              //... - zamienia tablice  na elementy oddzielone przecinkami [a,b,c]->a,b,c
              return AnswerButton(
                  answerText: answerXD,
                  onTap: () {
                    answerQuestion(answerXD);
                  });
            })
          ],
        ),
      ),
    );
  }
}
