import 'package:flutter/material.dart';
import 'package:medical/settings/history/widgets/history_card.dart';
import 'package:medical/widgets/custom_appbar.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(screenTitle: "History"),
                SizedBox(height: 32),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder:
                        (context, index) => HistoryCard(
                          image: "assets/order.png",
                          orderNumber: "123456  ",
                          date: "12-5-2023",
                          price: "250",
                          numberOfOrders: "1",
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
