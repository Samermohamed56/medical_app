
import 'package:flutter/material.dart';

class CustumCard extends StatelessWidget {
  const CustumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/med.png"),
                ),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            Text(
              "200 EGP",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            Row(
              children: [
                Text(
                  "230 EGP",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff6C7278),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "20% off",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 0, 38, 255),
                  ),
                ),
              ],
            ),
            Text(
              "Panadol Cold and Flu",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
