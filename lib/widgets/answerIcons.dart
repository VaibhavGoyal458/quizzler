import 'package:flutter/material.dart';

class AnswerIcons extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  AnswerIcons({@required this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Icon(
        icon,
        color: (iconColor != null) ? iconColor : Colors.white,
      ),
    );
  }
}
