import 'package:flutter/material.dart';
import 'package:quizzler/screens/launch.dart';
import 'package:quizzler/utils/constants.dart';
import 'package:quizzler/widgets/optionButton.dart';

class ResultPage extends StatelessWidget {
  final int result;
  ResultPage({this.result});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Material(
      color: kDeepTextColor,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'RESULTS',
                style: kResultText,
              ),
            ),
            Center(
              child: Text(
                'Congratulations!',
                style:
                    kResultText.copyWith(fontSize: 55, fontFamily: 'Bangers'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Container(
                height: width * 0.65,
                child: Image(
                  image: AssetImage('assets/images/cup.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  'YOU SCORED',
                  style: kResultText,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Center(
                child: Text(
                  '$result / 35',
                  style: kResultText.copyWith(
                      fontFamily: 'Bangers', fontSize: 100),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: width / 2,
                    height: 60,
                    child: OptionButton(
                      buttonText: 'Retake Quiz',
                      color: Colors.white,
                      textColor: kDeepTextColor,
                      textAlignment: Alignment.center,
                      action: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: width / 2,
                    height: 60,
                    child: OptionButton(
                      buttonText: 'Go Home',
                      color: Colors.white,
                      textColor: kDeepTextColor,
                      textAlignment: Alignment.center,
                      action: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LaunchPage(),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
