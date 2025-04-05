import 'package:flutter/material.dart';
import 'package:medical/view/widgets/custem_button.dart';
import 'package:medical/view/widgets/custom_appbar.dart';
import 'package:medical/view/widgets/custom_text_field.dart';

class AccountDetailsBody extends StatelessWidget {
  const AccountDetailsBody({super.key});

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
                CustomAppBar(screenTitle: "Profile"),
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
          ),
        ),
      ],
    );
  }
}
