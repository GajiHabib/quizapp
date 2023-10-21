
import 'package:flutter/material.dart';
import 'Resultscreen.dart';
import 'allQuiz.dart';

class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  int quizIndex = 0;
  int? selectedAnswerIndex;
  Color selectedColor = Colors.yellow;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text('${quizIndex + 1} / ${allQuiz.length}'),
            Text(
              allQuiz[quizIndex].question,
              textScaleFactor: 1.2,
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: allQuiz[quizIndex].answerList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAnswerIndex = index;
                      });
                    },
                    child: Card(
                      color: index == selectedAnswerIndex
                          ? selectedColor
                          : Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Center(
                            child: Text(
                                allQuiz[quizIndex].
                                answerList[index].answer)),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: ()async {
                  if (allQuiz[quizIndex]
                          .answerList[selectedAnswerIndex!]
                          .iscorrect ==
                      true){
                  score += 10;
                  setState(() {
                    selectedColor=Colors.green;
                  });
                      }else{
                        setState(() {
                          selectedColor=Colors.red;
                        });
                      }
                      await Future.delayed(const Duration(seconds:2));
                  if (quizIndex < allQuiz.length - 1) {
                    setState(() {
                      quizIndex++;
                      selectedColor=Colors.yellow;
                      selectedAnswerIndex=null;
                    });
                  }else{
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context, 
                    MaterialPageRoute(builder: (context) => Resultscreen
                    (score: score),));
                  }
                },
                child: const Text('Submit')),
                const SizedBox(height: 70,),
          ],
        ),
      ),
    );
  }
}
