import 'package:flutter/material.dart';
import 'package:medical/view/constance.dart';
import 'package:medical/view/settings/history/order%20details/order_details_history_body.dart';

class OrderDetailsHistoryView extends StatelessWidget {
  const OrderDetailsHistoryView({super.key});

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
          child: OrderDetailsHistoryBody(),
        ),
      ),
    );
  }
}
