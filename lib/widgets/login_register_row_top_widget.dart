import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';

class LoginRegisterRowTop extends StatelessWidget {
  const LoginRegisterRowTop(
      {Key? key, required this.title, required this.onClick})
      : super(key: key);

  final String title;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Welcome to Fashion Daily",
              style: TextStyle(
                color: secondaryText,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: primaryText,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'serif',
              ),
            ),
            GestureDetector(
              onTap: onClick,
              child: Text.rich(
                TextSpan(
                  text: "Help ",
                  style: TextStyle(
                    color: helpIcon,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.help,
                        color: helpIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
