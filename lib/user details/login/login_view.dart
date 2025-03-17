import 'package:flutter/material.dart';
import 'package:medical/user%20details/login/login_body.dart';
import 'package:medical/widgets/custom_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(body: LoginBody());
  }
}