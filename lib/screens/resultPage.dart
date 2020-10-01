import 'package:flutter/material.dart';
import 'package:quizzler/screens/launch.dart';
import 'package:quizzler/utils/constants.dart';
import 'package:quizzler/utils/size_config.dart';
import 'package:quizzler/widgets/optionButton.dart';

class ResultPage extends StatelessWidget {
  final int result;
  ResultPage({this.result});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = MediaQuery.of(context).size.width;
    return Material(
      color: kDeepTextColor,
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'RESULTS',
                  style: kResultText.copyWith(
                      fontSize: SizeConfig.blockSizeVertical * 3.8),
                ),
              ),
              Center(
                child: Text(
                  'Congratulations!',
                  style: kResultText.copyWith(
                      fontSize: SizeConfig.blockSizeVertical * 6.5,
                      fontFamily: 'Bangers'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockSizeVertical * 4),
                child: Container(
                  height: SizeConfig.blockSizeVertical * 30,
                  child: Image(
                    image: AssetImage('assets/images/cup.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical),
                child: Center(
                  child: Text(
                    'YOU SCORED',
                    style: kResultText.copyWith(
                        fontSize: SizeConfig.blockSizeVertical * 3.8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, 0, 0, SizeConfig.blockSizeVertical * 6),
                child: Center(
                  child: Text(
                    '$result / 35',
                    style: kResultText.copyWith(
                        fontFamily: 'Bangers',
                        fontSize: SizeConfig.blockSizeVertical * 12.5),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.blockSizeVertical / 2),
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
      ),
    );
  }
}
