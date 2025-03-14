import 'package:flutter/material.dart';
import 'package:medical/user%20details/signup/signup_body.dart';
import 'package:medical/constance.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,

          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: Constance.backgroundColor,
            ),
          ),
          child: SignupBody(),
        ),
      ),
    );
  }
}
