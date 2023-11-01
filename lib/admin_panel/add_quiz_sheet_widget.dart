// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addquizbottomsheetwidget extends StatefulWidget {
  addquizbottomsheetwidget({
    Key? key,
  }) : super(key: key);

  @override
  State<addquizbottomsheetwidget> createState() =>
      _addquizbottomsheetwidgetState();
}

class _addquizbottomsheetwidgetState extends State<addquizbottomsheetwidget> {
  TextEditingController quizController = TextEditingController();
  TextEditingController answer1Controller = TextEditingController();
  TextEditingController answer2Controller = TextEditingController();
  TextEditingController answer3Controller = TextEditingController();
  TextEditingController answer4Controller = TextEditingController();

  bool isCorrectAnswer1 = false;
  bool isCorrectAnswer2 = false;
  bool isCorrectAnswer3 = false;
  bool isCorrectAnswer4 = false;

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    print('Device Height = $deviceHeight');

    return Container(
      height: deviceHeight * 0.8,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(
          88,
          654,
          765,
          76,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView(children: [
        TextField(
          controller: quizController,
          decoration: InputDecoration(helperText: 'Input your Question'),
        ),
        Text('Input All Answers'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: TextField(
              controller: answer1Controller,
              decoration: InputDecoration(helperText: 'Answer 1'),
            )),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
             setState(() {
               isCorrectAnswer1=!isCorrectAnswer1;
             });
            }, child: Text(isCorrectAnswer1?'true':'false'))
          ],
        ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: TextField(
              controller: answer2Controller,
              decoration: InputDecoration(helperText: 'Answer 2'),
            )),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
             setState(() {
               isCorrectAnswer2=!isCorrectAnswer2;
             });
            }, child: Text(isCorrectAnswer2?'true':'false'))
          ],
        ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: TextField(
              controller: answer3Controller,
              decoration: InputDecoration(helperText: 'Answer 3'),
            )),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
             setState(() {
               isCorrectAnswer3=!isCorrectAnswer3;
             });
            }, child: Text(isCorrectAnswer3?'true':'false'))
          ],
        ),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: TextField(
              controller: answer4Controller,
              decoration: InputDecoration(helperText: 'Answer 4'),
            )),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
             setState(() {
               isCorrectAnswer4=!isCorrectAnswer4;
             });
            }, child: Text(isCorrectAnswer4?'true':'false'))
          ],
        ),
        ElevatedButton(onPressed: ()async{
         await addQuizToDB();
         Navigator.pop(context);
        }, child: Text('add to DB')),
      ]),
    );
  }
  Future<void>addQuizToDB()async{
       var collection = await FirebaseFirestore.instance.collection('all_quiz');
        Map<String, dynamic> quizMap = {
      'question': quizController.text,
      'answerList': [
        {'answer': answer1Controller.text, 'isCorrect': isCorrectAnswer1},
        {'answer': answer2Controller.text, 'isCorrect': isCorrectAnswer2},
        {'answer': answer3Controller.text, 'isCorrect': isCorrectAnswer3},
        {'answer': answer4Controller.text, 'isCorrect': isCorrectAnswer4},
      ]
    };

    await collection.add(quizMap);

    print('Quiz is successfully added to Database');
  }
}
