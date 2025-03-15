import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_text_field.dart';

class AccountDetailsBody extends StatelessWidget {
  const AccountDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(115, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(FontAwesomeIcons.chevronLeft, color: Colors.black),
                ),
                SizedBox(width: 24),
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              "Personal Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            CustemTextField(hintText: "full name", isPassword: false),
            CustemTextField(hintText: "email", isPassword: false),
            CustemTextField(hintText: "phone number", isPassword: false),
            SizedBox(height: 24),
            Text(
              "Change Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            CustemTextField(hintText: "current password", isPassword: true),
            CustemTextField(hintText: "new password", isPassword: true),
            CustemTextField(hintText: "confirm password", isPassword: true),
            SizedBox(height: 24),
            CustomButton(
              text: "Save Changes",
              backgroundcolor: Color(0xff26864E),
            ),
          ],
        ),
      ),]
    );
  }
}
