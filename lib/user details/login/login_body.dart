import 'package:flutter/material.dart';
import 'package:medical/user%20details/login/widgets/remember_and_forgot.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_text_field.dart';
import 'package:medical/widgets/dont_have_account.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

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
                SizedBox(),
                Text(
                  "Sign in to your Account",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12),

                Text(
                  "Enter your email and password to log in",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff6C7278),
                  ),
                ),
                SizedBox(),

                CustemTextField(hintText: "email", isPassword: false),

                CustemTextField(hintText: "password", isPassword: true),
                RememberAndForgot(),
                SizedBox(height: 16),
                CustomButton(
                  text: "Log In",
                  backgroundcolor: Color(0xff26864E),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    "-----------------------------OR-----------------------------",
                    style: TextStyle(
                      color: Color(0xff6C7278),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                CustomButton(
                  iconimage: Image.asset("assets/google.png"),
                  text: "Continue with Google",
                  backgroundcolor: Colors.white,
                  color: Color(0xff26292C),
                ),
                SizedBox(height: 8),
                CustomButton(
                  iconimage: Image.asset("assets/facebook.png"),
                  text: "Continue with Facebook",
                  backgroundcolor: Colors.white,
                  color: Color(0xff26292C),
                ),
                SizedBox(height: 100),
                DontHaveAccount(),
                SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
