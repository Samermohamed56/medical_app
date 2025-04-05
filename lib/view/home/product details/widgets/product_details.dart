import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/view/cart/cart_view.dart';
import 'package:medical/view/widgets/custem_button.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails(
      {super.key,
      required this.medName,
      required this.medMG,
      required this.medPills,
      required this.medInfo});
  final String medName, medMG, medPills, medInfo;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Text(
              medMG,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xff6C7278),
              ),
            ),
            SizedBox(height: 12),
            Text(
              medPills,
            ),
            SizedBox(height: 12),
            SpinBox(
              incrementIcon: Icon(
                FontAwesomeIcons.plus,
                color: Color.fromARGB(255, 10, 187, 10),
              ),
              decrementIcon: Icon(
                FontAwesomeIcons.minus,
                color: Color.fromARGB(255, 255, 0, 0),
              ),
              min: 1,
              textStyle: TextStyle(color: Colors.black, fontSize: 20),
              max: 100,
              value: 1,
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Product details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Text(
              medInfo,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xff6C7278),
              ),
            ),
            SizedBox(height: 32),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartView()),
                );
              },
              text: "Add to cart",
              backgroundcolor: Color(0xff26864E),
            ),
          ],
        ),
      ),
    );
  }
}
