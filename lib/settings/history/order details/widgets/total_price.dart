import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.total,
  });
  final String subtotal, discount, total;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Subtotal",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                subtotal,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Discount",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Text(
                discount,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
              ),
              Text(
                total,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
