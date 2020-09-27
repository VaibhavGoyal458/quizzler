import 'package:flutter/material.dart';
import 'package:quizzler/screens/resultPage.dart';
import 'package:quizzler/utils/constants.dart';
import 'package:quizzler/utils/quiz_brain.dart';
import 'package:quizzler/widgets/optionButton.dart';

enum AnswerState { isTrue, isFalse }

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  AnswerState state;
  QuizBrain quizBrain = QuizBrain();
  double progress = 1 / 35;
  int score = 0;
  bool selectedAnswer;

  void checkAnswers(bool userAnswer) {
    bool correctAnswer = quizBrain.getAns();
    if (userAnswer == correctAnswer) {
      score++;
    } else {
      return;
    }
    selectedAnswer = null;
  }

  void quizIsFinished() {
    if (quizBrain.isFinished() == true) {
      int finalScore = score;
      quizBrain.reset();
      setState(() {
        progress = 1 / 35;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            result: finalScore,
          ),
        ),
      );
      score = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '${(progress * 35).toInt()} / 35',
                      style: kLaunchTextStyle.copyWith(
                          color: Colors.white, fontFamily: 'Bangers'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: Color(0xFF7D82D8),
                      valueColor: AlwaysStoppedAnimation(
                        kDeepHighlightColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 55, 40, 50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        heightFactor: 1,
                        child: Text(
                          'Question',
                          style: kQuizQuestionTextStyle.copyWith(
                              color: kDeepTextColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Expanded(
                              flex: 9,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    quizBrain.getQues(),
                                    style: kQuizQuestionTextStyle.copyWith(
                                      fontSize: 42,
                                      color: kDeepTextColor,
                                      wordSpacing: -1,
                                      height: 1.2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: OptionButton(
                                  buttonText: 'True',
                                  borderColor: state == AnswerState.isTrue
                                      ? kDeepTextColor
                                      : kBorderColor,
                                  textColor: state == AnswerState.isTrue
                                      ? Colors.white
                                      : Color(0xAA311B92),
                                  color: state == AnswerState.isTrue
                                      ? kDeepTextColor
                                      : Colors.white,
                                  textAlignment: Alignment.centerLeft,
                                  action: () {
                                    setState(() {
                                      state = AnswerState.isTrue;
                                    });
                                    selectedAnswer = true;
                                  },
                                  verticalPadding: height / 45,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: OptionButton(
                                  buttonText: 'False',
                                  borderColor: state == AnswerState.isFalse
                                      ? kDeepTextColor
                                      : kBorderColor,
                                  textColor: state == AnswerState.isFalse
                                      ? Colors.white
                                      : Color(0xAA311B92),
                                  color: state == AnswerState.isFalse
                                      ? kDeepTextColor
                                      : Colors.white,
                                  textAlignment: Alignment.centerLeft,
                                  action: () {
                                    setState(() {
                                      state = AnswerState.isFalse;
                                    });
                                    selectedAnswer = false;
                                  },
                                  verticalPadding: height / 45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: width * 0.4,
                child: FlatButton(
                  color: kDeepHighlightColor,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 30, horizontal: width / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Next',
                          style:
                              kLaunchButtonStyle.copyWith(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_right,
                          size: 45,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      checkAnswers(selectedAnswer);
                      quizBrain.nextQuestion();
                      state = null;
                      progress += 1 / 35;
                      quizIsFinished();
                    });
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
