import 'package:flutter/material.dart';
import 'package:medical/view/cart/cart_body.dart';
import 'package:medical/view/widgets/custom_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(body: CartBody());
  }
}
