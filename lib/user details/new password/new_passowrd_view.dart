import 'package:flutter/material.dart';
import 'package:medical/constance.dart';
import 'package:medical/user%20details/new%20password/new_password_body.dart';

class NewPassowrdView extends StatelessWidget {
  const NewPassowrdView({super.key});

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
          child: NewPasswordBody(),
        ),
      ),
    );
  }
}