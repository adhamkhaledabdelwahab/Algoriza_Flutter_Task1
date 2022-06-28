import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage(
      {Key? key,
      required this.imagePath,
      required this.titleText,
      required this.subtitleText})
      : super(key: key);

  final String imagePath;
  final String titleText;
  final String subtitleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(imagePath),
          ),
          Text(
            titleText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: primaryText,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            subtitleText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: secondaryText,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
