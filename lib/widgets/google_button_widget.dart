import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key, required this.onClick}) : super(key: key);

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: TextButton(
        onPressed: onClick,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: helpIcon,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/google.png",
              width: 20,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              "Sign with by google",
              style: TextStyle(
                color: helpIcon,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
