class Quiz{
  final String question;
  final List<Answer>answerList;
  Quiz ({required this.question, required this.answerList});
}

class Answer{
  final String answer;
  final bool iscorrect;
  Answer({required this.answer,required this.iscorrect});
}
List <Quiz>allQuiz=[
Quiz(question: 'what is the national animal of bangaladesh', answerList: [
  Answer(answer: 'dog', iscorrect: false),
    Answer(answer: 'Rb Tiger', iscorrect: true),
      Answer(answer: 'dog', iscorrect: false),
        Answer(answer: 'dog', iscorrect: false),
]),
Quiz(question: 'what is the national fruit of bangaladesh', answerList: [
  Answer(answer: 'banana', iscorrect: false),
    Answer(answer: 'jacfruit', iscorrect: true),
      Answer(answer: 'mango', iscorrect: false),
        Answer(answer: 'apply', iscorrect: false),
]),
Quiz(question: 'what is the national fish of bangaladesh', answerList: [
  Answer(answer: 'dcrp', iscorrect: false),
    Answer(answer: 'hilsha', iscorrect: true),
      Answer(answer: 'carb', iscorrect: false),
        Answer(answer: 'golda', iscorrect: false),
]),
Quiz(question: 'what is the national fluwer of bangaladesh', answerList: [
  Answer(answer: 'sun', iscorrect: false),
    Answer(answer: 'shapla', iscorrect: true),
      Answer(answer: 'hena', iscorrect: false),
        Answer(answer: 'hasna', iscorrect: false),
]),
];