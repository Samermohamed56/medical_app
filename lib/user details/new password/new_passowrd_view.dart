import 'package:flutter/material.dart';
import 'package:medical/user%20details/new%20password/new_password_body.dart';
import 'package:medical/widgets/custom_view.dart';

class NewPassowrdView extends StatelessWidget {
  const NewPassowrdView({super.key});

  @override
  Widget build(BuildContext context) {
   return CustomView(body: NewPasswordBody()) ;
  }
}