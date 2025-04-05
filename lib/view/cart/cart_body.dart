import 'package:flutter/material.dart';
import 'package:medical/view/cart/empty%20cart/widgets/cart_card.dart';
import 'package:medical/view/cart/empty%20cart/widgets/total_container.dart';
import 'package:medical/view/widgets/custom_appbar.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: CustomAppBar(screenTitle: "Cart"),
                ),
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
                SizedBox(height: 16),
                CartCard(
                  image: "assets/med.png",
                  name: "strepsils",
                  price: "120 EGP",
                ),
                SizedBox(height: 8),
                CartCard(
                  image: "assets/med.png",
                  name: "strepsils",
                  price: "120 EGP",
                ),
                SizedBox(height: 8),
                CartCard(
                  image: "assets/med.png",
                  name: "strepsils",
                  price: "120 EGP",
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Remove All",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                TotalContainer(price: "170 EGP"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
