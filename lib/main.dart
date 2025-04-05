import 'package:flutter/material.dart';
import 'package:medical/view/user%20details/signup/signup_view.dart';

void main() {
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SignupView());
  }
}
