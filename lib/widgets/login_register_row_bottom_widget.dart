import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';

class LoginRegisterRowBottom extends StatelessWidget {
  const LoginRegisterRowBottom(
      {Key? key,
      required this.text1,
      this.text2,
      this.onCLick,
      required this.fontSize})
      : super(key: key);

  final String text1;
  final String? text2;
  final double fontSize;
  final Function()? onCLick;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text1,
        style: TextStyle(
          color: secondaryText,
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
        ),
        children: text2 != null
            ? [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: onCLick,
                    child: Text(
                      text2!,
                      style: TextStyle(
                        color: helpIcon,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      textAlign: TextAlign.center,
    );
  }
}
