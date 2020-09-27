import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzler/screens/launch.dart';
import 'package:quizzler/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: LaunchPage(),
        ),
      ),
    );
  }
}
