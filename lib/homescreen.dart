

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:quizapp/admin_panel/admin_panel.dart';
import 'Quizscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homescreen extends StatelessWidget {
  const homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center
      (child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(height: 10,),
        Text
        ('Quiz App',style: TextStyle(fontSize: 50),),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 250,),
        ElevatedButton(onPressed:
         (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Quizscreen())
            );
        }, child: Text(
          'Next Quiz',style: TextStyle(fontSize: 50),
        ),
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder()
          ),
          ),
      Padding(padding: EdgeInsets.all(50),
      
      child:  ElevatedButton(onPressed: (){
          addDataToDB();
      }, child: Text('database'),style: ElevatedButton.styleFrom(shape: StadiumBorder()),),


  
      ),
      Padding(padding:EdgeInsets.all(26),
      child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>admin_panel() ,));
      }, child: Text('Admin panel'),style:ElevatedButton.styleFrom(shape: StadiumBorder()),),
      )
      ],
      )
      ],
      ),
      ),
    );
  }
}
 Future<void>addDataToDB()async{
  var collection = await  FirebaseFirestore.instance.collection('allquiz');
    Map<String, dynamic> quizMap = {
      'question': 'What is the capital of France?',
      'answerList': [
        {'answer': 'Berlin', 'isCorrect': false},
        {'answer': 'London', 'isCorrect': false},
        {'answer': 'Paris', 'isCorrect': true},
        {'answer': 'Madrid', 'isCorrect': false},
      ]
    };
       collection.add(quizMap);

 }
