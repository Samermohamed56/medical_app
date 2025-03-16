import 'package:flutter/material.dart';
import 'package:medical/cart/empty%20cart/empty_cart_body.dart';
import 'package:medical/constance.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

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
          child: EmptyCartBody(),
        ),
      ),
    );
  }
}
