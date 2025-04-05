import 'package:flutter/material.dart';
import 'package:medical/view/settings/history/order%20details/widgets/order_card.dart';
import 'package:medical/view/settings/history/order%20details/widgets/total_price.dart';
import 'package:medical/view/widgets/custom_appbar.dart';

class OrderDetailsHistoryBody extends StatelessWidget {
  const OrderDetailsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(screenTitle: "Order Details"),
                SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(color: Color(0xffEBF9F1)),
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "you have 3 items in your order",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff1B5E37),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                OrderCard(
                  image: "assets/med.png",
                  title: "Strepsils orange 24 lozenges tablets",
                  price: "120 EGP",
                ),
                SizedBox(height: 16),
                OrderCard(
                  title: "Augmentin 1mg 14 tablets",
                  price: "59 EGP",
                  image: "assets/med2.png",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                TotalPrice(subtotal: "179", discount: "9", total: "170"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
