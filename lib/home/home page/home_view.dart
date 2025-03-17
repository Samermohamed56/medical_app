import 'package:flutter/material.dart';
import 'package:medical/home/home%20page/home_body.dart';
import 'package:medical/widgets/custom_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(body: HomeBody());
  }
}
