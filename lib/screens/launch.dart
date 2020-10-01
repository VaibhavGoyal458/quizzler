import 'package:flutter/material.dart';
import 'package:quizzler/screens/quizPage.dart';
import 'package:quizzler/utils/constants.dart';
import 'package:quizzler/utils/size_config.dart';

class LaunchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: SizeConfig.blockSizeVertical * 50,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 7),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Image(
                    image: AssetImage('assets/images/hero.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal * 5),
                    child: Text(
                      'Let\'s see how you perform on a Zoom Quiz!',
                      style: kLaunchTextStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockSizeHorizontal * 5,
                          vertical: SizeConfig.blockSizeVertical * 1),
                      child: Text(
                        'You have got 50% change of getting the answers right.',
                        style: kLaunchTextSubStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 15,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: SizeConfig.blockSizeHorizontal * 70,
                  child: FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical * 3.5,
                          horizontal: SizeConfig.blockSizeHorizontal * 5),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Let\'s Begin',
                            style: kLaunchButtonStyle.copyWith(
                                fontSize: SizeConfig.blockSizeVertical * 5),
                          ),
                          Expanded(
                            child: Align(
                              heightFactor: 1,
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.arrow_right,
                                size: SizeConfig.blockSizeVertical * 5,
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
