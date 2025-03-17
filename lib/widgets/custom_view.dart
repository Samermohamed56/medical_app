import 'package:flutter/material.dart';
import 'package:medical/constance.dart';

class CustomView extends StatelessWidget {
  const CustomView({super.key, required this.body});
final Widget body;
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
          child: body,
        ),
      ),
    );
  }
}