import 'package:flutter/material.dart';
import 'package:quizzler/screens/resultPage.dart';
import 'package:quizzler/utils/constants.dart';
import 'package:quizzler/utils/quiz_brain.dart';
import 'package:quizzler/utils/size_config.dart';
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
    SizeConfig().init(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeHorizontal * 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeHorizontal / 2),
                      child: Text(
                        '${(progress * 35).toInt()} / 35',
                        style: kLaunchTextStyle.copyWith(
                            color: Colors.white,
                            fontFamily: 'Bangers',
                            fontSize: SizeConfig.blockSizeVertical * 4.2),
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
            Container(
              height: SizeConfig.blockSizeVertical * 75,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 2.5,
                    horizontal: SizeConfig.blockSizeHorizontal * 7.5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 3.5)),
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
                                color: kDeepTextColor,
                                fontSize: SizeConfig.blockSizeVertical * 3),
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
                                        fontSize:
                                            SizeConfig.blockSizeVertical * 5,
                                        color: kDeepTextColor,
                                        wordSpacing: -1,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: SizeConfig.blockSizeVertical * 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: SizeConfig.blockSizeVertical),
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
                              Container(
                                height: SizeConfig.blockSizeVertical * 10,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: SizeConfig.blockSizeVertical),
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
                  width: SizeConfig.blockSizeHorizontal * 40,
                  child: FlatButton(
                    color: kDeepHighlightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              SizeConfig.blockSizeVertical * 6.5)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical * 2.5,
                          horizontal: SizeConfig.blockSizeHorizontal * 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: kLaunchButtonStyle.copyWith(
                                fontSize: SizeConfig.blockSizeVertical * 4,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: SizeConfig.blockSizeVertical * 4,
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
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
