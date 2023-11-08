
// ignore_for_file: unused_local_variabl
import 'package:flutter/material.dart';
import 'package:quizapp/helpers.dart';
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
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<List<Quiz>>(
              future:Helpers. getAllQuiz(),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.done){
                  if (snapshot.data!=[]){
                    var allQuiz=snapshot.data!;
                     return Column(
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
                        (score: score)));
                      }
                    },
                    child: Text('Next Quiz')),
                    const SizedBox(height: 70,),
                  
              ],
            );

                  }else{
                    return Center(child: Text('no Quiz'));
                  }
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
         
          ),
        ),
      ),
    );
  }

}
