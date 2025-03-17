import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRowPrivacyDetails extends StatelessWidget {
  const CustomRowPrivacyDetails({super.key, required this.view, required this.title});
final Widget view;
final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => view),
        );
      },
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff000000),
            ),
          ),
          Spacer(),
          Icon(FontAwesomeIcons.chevronRight, color: Color(0xff000000)),
        ],
      ),
    );
  }
}
