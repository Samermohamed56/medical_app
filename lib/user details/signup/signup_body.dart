import 'package:flutter/material.dart';
import 'package:medical/home/home%20page/home_view.dart';
import 'package:medical/user%20details/login/login_view.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_text_field.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

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
                Text(
                  "sign up",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 12),

                Text(
                  "Create an account to continue! ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff6C7278),
                  ),
                ),
                SizedBox(height: 24),
                CustemTextField(hintText: "first name", isPassword: false),
                CustemTextField(hintText: "last name", isPassword: false),
                CustemTextField(hintText: "email", isPassword: false),
                CustemTextField(hintText: "age", isPassword: false),
                CustemTextField(hintText: "password", isPassword: true),
                SizedBox(height: 24),
                CustomButton(
                  text: "Register",
                  backgroundcolor: Color(0xff26864E),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  },
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Color(0xff6C7278),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xff07AA59),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
