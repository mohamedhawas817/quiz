import 'package:flutter/material.dart';
import 'quiz_brain.dart';


void main() {
  runApp(Quiz());
}

class Quiz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizChild(),
        ),
      ),
    ),);
  }
}

class QuizChild extends StatefulWidget {
  @override
  _QuizChildState createState() => _QuizChildState();
}

class _QuizChildState extends State<QuizChild> {
  List<Icon> scoreKeeper = [];
  QuizBrain questions = QuizBrain();



  void checkAnswer(bool userPickedAnswer, context) {
    bool correct = questions.getAnswer();
    if(userPickedAnswer == correct) {
     setState(() {
       scoreKeeper.add(Icon(
         Icons.check,
         color: Colors.green,
       ));
     });
    }else {
      setState(() {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.redAccent,
        ));
      });
    }
    setState(() {
      questions.nexQ(scoreKeeper, context);
    });

  }


  //List<Question> questions = [
    // q1.questionText,

  // ];

  // List<bool> answers = [true,true, false];






  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                questions.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              textColor: Colors.pink,
                color: Colors.redAccent,


                onPressed: () {

               checkAnswer(true, context);
                }
                ,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,


              onPressed: () {
                
                checkAnswer(false, context);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),

            ),
          ),
        ),
        Row(
          children: scoreKeeper ,
        )

      ],
    );
  }
}


  
  
