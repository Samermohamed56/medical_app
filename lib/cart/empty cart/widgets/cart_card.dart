
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.image, required this.name, required this.price});
final String image, name, price;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Image.asset(image, height: 50, fit: BoxFit.fill),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 95, 105, 99),
                ),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 120,
            child: SpinBox(
              iconSize: 20,
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
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Color.fromARGB(255, 180, 32, 32)),
          ),
        ],
      ),
    );
  }
}
