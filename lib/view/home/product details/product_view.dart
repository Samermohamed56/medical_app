import 'package:flutter/material.dart';
import 'package:medical/view/home/product%20details/product_body.dart';
import 'package:medical/view/widgets/custom_view.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(body: ProductBody());
  }
}
