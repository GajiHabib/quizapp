// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'allQuiz.dart';

class Helpers{
  static Future<List<Quiz>>getAllQuiz()async{
List <Quiz> quizList=[];
var collectionSnapshot=
await FirebaseFirestore.instance.collection('allquiz').get();
for ( var documentSnapshot in collectionSnapshot.docs){
String question =documentSnapshot.get('question');
List answerMapList=documentSnapshot.get('answerList');
String dosId=documentSnapshot.reference.id;
List <Answer> answerList=[];
for (var answerMap in answerMapList){
  Answer myanswer=Answer(answer: answerMap['answer'], iscorrect: answerMap['isCorrect']);
  answerList.add(myanswer);
}
Quiz myquiz= Quiz(question: question, answerList: answerList,id: dosId);
quizList.add(myquiz);
}
return quizList;
  }
}