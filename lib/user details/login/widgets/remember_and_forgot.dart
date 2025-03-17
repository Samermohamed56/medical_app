import 'package:flutter/material.dart';
import 'package:medical/user%20details/forgot%20password/forgot_password_view.dart';

class RememberAndForgot extends StatelessWidget {
  const RememberAndForgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (bool? value) {}),
        Text(
          "Remember me",
          style: TextStyle(
            color: Color(0xff6C7278),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPasswordView()),
            );
          },
          child: Text(
            "Forgot Password ?",
            style: TextStyle(
              color: Color(0xff07AA59),
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
