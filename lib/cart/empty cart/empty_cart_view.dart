import 'package:flutter/material.dart';
import 'package:medical/cart/empty%20cart/empty_cart_body.dart';
import 'package:medical/widgets/custom_view.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(body: EmptyCartBody());
  }
}
