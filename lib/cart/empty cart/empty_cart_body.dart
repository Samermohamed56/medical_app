import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/home/home%20page/home_view.dart';
import 'package:medical/widgets/custem_button.dart';

class EmptyCartBody extends StatelessWidget {
  const EmptyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(FontAwesomeIcons.chevronLeft),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/empty.png"),
                  SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    text: "Explore Categories",
                    backgroundcolor: Color(0xff26864E),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
