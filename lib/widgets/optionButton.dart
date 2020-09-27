import 'package:flutter/material.dart';
import 'package:quizzler/utils/constants.dart';

class OptionButton extends StatelessWidget {
  final String buttonText;
  final Function action;
  final Color color;
  final Color textColor;
  final Color borderColor;
  final AlignmentGeometry textAlignment;
  final double verticalPadding;

  OptionButton(
      {@required this.buttonText,
      @required this.action,
      this.color,
      this.textColor,
      this.borderColor,
      this.textAlignment,
      this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor != null ? borderColor : kBorderColor,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      color: (color != null) ? color : Colors.white,
      child: Align(
        alignment: textAlignment,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding != null ? verticalPadding : 0,
              horizontal: 20),
          child: Text(
            '${buttonText.toUpperCase()}',
            style: kOptionButtonTextStyle.copyWith(color: textColor),
          ),
        ),
      ),
      onPressed: action,
    );
  }
}
