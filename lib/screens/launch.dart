import 'package:flutter/material.dart';
import 'package:quizzler/screens/quizPage.dart';
import 'package:quizzler/utils/constants.dart';

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(width / 15),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image(
                    image: AssetImage('assets/images/hero.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Text(
                  'Let\'s see how you perform on a Zoom Quiz!',
                  textAlign: TextAlign.left,
                  style: kLaunchTextStyle,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Text(
                  'You have got 50% change of getting the answers right.',
                  textAlign: TextAlign.left,
                  style: kLaunchTextSubStyle,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: width * 0.7,
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 30, horizontal: width / 20),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Let\'s Begin',
                            style: kLaunchButtonStyle,
                          ),
                          Expanded(
                            child: Align(
                              heightFactor: 1,
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_right,
                                size: 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => QuizPage()));
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
