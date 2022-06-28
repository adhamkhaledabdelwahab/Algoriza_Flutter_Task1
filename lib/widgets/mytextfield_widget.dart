import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task1/main_colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.label,
      required this.myController,
      this.isValid = true,
      this.isPassword = false,
      this.inputType = TextInputType.text,
      this.showPassword = false,
      this.isCountryNumber = false,
      required this.hintText,
      required this.errorText,
      this.onClickShowPassword})
      : super(key: key);

  final String label;
  final TextEditingController myController;
  final bool isValid;
  final bool isPassword;
  final TextInputType inputType;
  final bool showPassword;
  final bool isCountryNumber;
  final String hintText;
  final String errorText;
  final Function()? onClickShowPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 17,
                  color: secondaryText,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          obscureText: isPassword ? showPassword : false,
          keyboardType: inputType,
          controller: myController,
          decoration: InputDecoration(
            suffixIcon: isPassword == false
                ? isValid == false
                    ? const Icon(
                        Icons.warning,
                        color: Colors.red,
                      )
                    : null
                : IconButton(
                    onPressed: onClickShowPassword,
                    icon: showPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility)),
            prefixIcon: isCountryNumber
                ? Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CountryCodePicker(
                      builder: (code) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${code!.dialCode}",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: primaryText,
                            ),
                          ],
                        );
                      },
                      onChanged: print,
                      initialSelection: 'EG',
                      favorite: const ["EG", "+966"],
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(left: 15),
            border: const OutlineInputBorder(),
            hintText: hintText,
            hintStyle: TextStyle(
              color: secondaryText,
              fontWeight: FontWeight.w300,
            ),
            errorText: isValid == false ? errorText : null,
          ),
        ),
      ],
    );
  }
}
