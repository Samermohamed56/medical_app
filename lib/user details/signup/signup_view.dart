import 'package:flutter/material.dart';
import 'package:medical/user%20details/signup/signup_body.dart';
import 'package:medical/widgets/custom_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(body:SignupBody() );
  }
}
