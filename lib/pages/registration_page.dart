import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';
import 'package:flutter_task1/pages/login_page.dart';
import 'package:flutter_task1/widgets/google_button_widget.dart';
import 'package:flutter_task1/widgets/login_register_row_bottom_widget.dart';
import 'package:flutter_task1/widgets/login_register_row_top_widget.dart';
import 'package:flutter_task1/widgets/mybutton_widget.dart';
import 'package:flutter_task1/widgets/mytextfield_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String _emailErrorMsg = "";
  String _numberErrorMsg = "";
  String _passwordErrorMsg = "";
  bool _emailValid = true;
  bool _numberValid = true;
  bool _passwordValid = true;
  bool showPassword = true;

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
                height: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    LoginRegisterRowTop(
                      title: 'Register',
                      onClick: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                      hintText: ' Eg. example@email.com',
                      label: 'Email',
                      errorText: _emailErrorMsg,
                      isValid: _emailValid,
                      myController: _email,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyTextField(
                      hintText: ' Eg. 812345678',
                      label: 'Phone Number',
                      inputType: TextInputType.number,
                      errorText: _numberErrorMsg,
                      isCountryNumber: true,
                      isValid: _numberValid,
                      myController: _number,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyTextField(
                      hintText: 'Password',
                      label: 'Password',
                      errorText: _passwordErrorMsg,
                      isValid: _passwordValid,
                      myController: _password,
                      isPassword: true,
                      inputType: TextInputType.visiblePassword,
                      showPassword: showPassword,
                      onClickShowPassword: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    MyButton(
                      borderRadius: 5.0,
                      onCLick: () {
                        setState(() {
                          if (_email.text.isEmpty) {
                            _emailErrorMsg = "Email field is required.";
                            _emailValid = false;
                          } else if (!isValidEmail(_email.text)) {
                            _emailErrorMsg = "Wrong Email format.";
                            _emailValid = false;
                          } else if (_email.text.isNotEmpty &&
                              isValidEmail(_email.text)) {
                            _emailErrorMsg = "";
                            _emailValid = true;
                          }

                          if (_number.text.isEmpty) {
                            _numberErrorMsg = "Phone Number field is required.";
                            _numberValid = false;
                          } else if (_number.text.length < 8) {
                            _numberErrorMsg = "Phone Number is not registered.";
                            _numberValid = false;
                          } else if (_number.text.isNotEmpty &&
                              _number.text.length > 8) {
                            _numberErrorMsg = "";
                            _numberValid = true;
                          }

                          if (_password.text.isEmpty) {
                            _passwordErrorMsg = "Password field is required.";
                            _passwordValid = false;
                          } else if (_password.text.length < 8) {
                            _passwordErrorMsg =
                                "Password must be greater than or equal 8 digits.";
                            _passwordValid = false;
                          } else if (_password.text.isNotEmpty &&
                              _password.text.length > 8) {
                            _passwordErrorMsg = "";
                            _passwordValid = true;
                          }
                        });
                      },
                      buttonColor: helpIcon,
                      text: 'Register',
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
                      text1: 'Has any account? ',
                      onCLick: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LoginPage()));
                      },
                      text2: 'Sign in here',
                      fontSize: 17,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginRegisterRowBottom(
                      text1:
                          "By registering you account, you are agree to our ",
                      onCLick: () {},
                      text2: "terms and condition",
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

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
