import 'package:flutter/material.dart';
import 'package:medical/user%20details/verify/verify_view.dart';
import 'package:medical/widgets/already_have_an_account.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_appbar.dart';
import 'package:medical/widgets/custom_text_field.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

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
                CustomAppBar(screenTitle: ""),
                SizedBox(height: 24),

                Text(
                  "forgot password",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12),

                Text(
                  "Don't worry, just enter your phone number or email and we will send you a verification code.",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff6C7278),
                  ),
                ),
                SizedBox(height: 24),

                CustemTextField(hintText: "Email", isPassword: false),

                SizedBox(height: 24),
                CustomButton(
                  text: "Send Code",
                  backgroundcolor: Color(0xff26864E),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VerifyView()),
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
