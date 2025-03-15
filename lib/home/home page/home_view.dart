import 'package:flutter/material.dart';
import 'package:medical/constance.dart';
import 'package:medical/home/home%20page/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          child: HomeBody(),
        ),
      ),
    );
  }
}
