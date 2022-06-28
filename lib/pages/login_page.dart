import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';
import 'package:flutter_task1/pages/registration_page.dart';
import 'package:flutter_task1/widgets/google_button_widget.dart';
import 'package:flutter_task1/widgets/login_register_row_bottom_widget.dart';
import 'package:flutter_task1/widgets/login_register_row_top_widget.dart';
import 'package:flutter_task1/widgets/mybutton_widget.dart';
import 'package:flutter_task1/widgets/mytextfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _number = TextEditingController();
  bool _numberValid = true;
  String _numberErrMsg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/login_register.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    LoginRegisterRowTop(
                      title: 'Sign in',
                      onClick: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      hintText: ' Eg. 812345678',
                      label: 'Phone Number',
                      errorText: _numberErrMsg,
                      isCountryNumber: true,
                      isValid: _numberValid,
                      inputType: TextInputType.number,
                      myController: _number,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyButton(
                      borderRadius: 5.0,
                      onCLick: () {
                        setState(() {
                          if (_number.text.isEmpty) {
                            _numberErrMsg = 'Phone number field is required.';
                            _numberValid = false;
                          } else if (_number.text.length < 8) {
                            _numberErrMsg = 'Phone number is not registered.';
                            _numberValid = false;
                          } else {
                            _numberErrMsg = '';
                            _numberValid = true;
                          }
                        });
                      },
                      buttonColor: helpIcon,
                      text: 'Sign In',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "Or",
                      style: TextStyle(color: secondaryText, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    GoogleButton(onClick: () {}),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginRegisterRowBottom(
                      text1: 'Doesn\'t has any account? ',
                      onCLick: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const RegistrationPage()));
                      },
                      text2: 'Register here',
                      fontSize: 17,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const LoginRegisterRowBottom(
                      text1:
                          "Use the application according to privacy rules. Any kinds of violations will be subject to sanctions.",
                      fontSize: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
