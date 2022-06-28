import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.borderRadius,
      required this.text,
      required this.onCLick,
      required this.buttonColor})
      : super(key: key);

  final double borderRadius;
  final String text;
  final Function() onCLick;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: buttonColor,
        onPressed: onCLick,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
