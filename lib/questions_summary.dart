import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Color colorOfCirlce(String correctAnswer, String chosenAnswer) {
    if (correctAnswer == chosenAnswer) {
      return const Color.fromRGBO(15, 186, 212, 1);
    } else {
      return const Color.fromARGB(255, 255, 7, 185);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colorOfCirlce(
                                (data['correct_answer'] as String),
                                (data['chosen_answer'] as String)),
                          ),
                        ),
                        Text(((data['question_index'] as int) + 1).toString()),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (data['question'] as String),
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: const Color.fromRGBO(224, 196, 255, 1),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Text(
                            (data['correct_answer'] as String),
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              color: Color.fromARGB(255, 255, 7, 185),
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            (data['chosen_answer'] as String),
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              color: Color.fromRGBO(15, 186, 212, 1),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
