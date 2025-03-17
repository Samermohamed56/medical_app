import 'package:flutter/material.dart';
import 'package:medical/user%20details/forgot%20password/forgot_password_body.dart';
import 'package:medical/widgets/custom_view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(body: ForgotPasswordBody());
  }
}
