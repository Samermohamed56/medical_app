import 'package:flutter/material.dart';
import 'package:medical/constance.dart';
import 'package:medical/user%20details/login/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          child: LoginBody(),
        ),
      ),
    );
  }
}