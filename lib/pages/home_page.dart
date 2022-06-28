import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';
import 'package:flutter_task1/widgets/mybutton_widget.dart';
import 'package:flutter_task1/widgets/onboard_pages_widget.dart';
import 'package:flutter_task1/pages/login_page.dart';
import 'package:flutter_task1/pages/registration_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int selectedIndex = 0;
  List<String> imagePaths = [
    "assets/food-delivery.png",
    "assets/food-buying.png"
  ];
  List<String> titleTexts = [
    "Get food delivery to your doorstep asap",
    "Buy any food from your favourite restaurant"
  ];
  List<String> subtitleTexts = [
    "We have young and professional delivery team that will bring your food as soon as possible to your doorstep",
    "We are constantly adding your favourite restaurant throughout the territory and around your area carefully selected"
  ];
  PageController myController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const LoginPage()));
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: skipButton,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: primaryText,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(
                  TextSpan(
                      text: "7",
                      style: TextStyle(
                        color: logoName1,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: "Krave",
                          style: TextStyle(
                            color: logoName2,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: myController,
                itemCount: 2,
                onPageChanged: (i) {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                itemBuilder: (ctx, i) => OnBoardPage(
                  imagePath: imagePaths[i],
                  titleText: titleTexts[i],
                  subtitleText: subtitleTexts[i],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    2,
                    (index) => GestureDetector(
                          onTap: () {
                            myController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          child: AnimatedContainer(
                            margin: const EdgeInsets.only(right: 5.0),
                            height: 10.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                              color: index == selectedIndex
                                  ? selectedIndicator
                                  : unSelectedIndicator,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            duration: const Duration(milliseconds: 300),
                          ),
                        ))
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: MyButton(
                  borderRadius: 10,
                  text: "Get Started",
                  onCLick: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginPage()));
                  },
                  buttonColor: getStartedButton),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: primaryText,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RegistrationPage()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: getStartedButton,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
