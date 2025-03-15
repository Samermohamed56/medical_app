import 'package:flutter/material.dart';
import 'package:medical/user%20details/forgot%20password/forgot_password_view.dart';
import 'package:medical/user%20details/signup/signup_view.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_text_field.dart';

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
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (bool? value) {}),
                    Text(
                      "Remember me",
                      style: TextStyle(
                        color: Color(0xff6C7278),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordView(),
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                          color: Color(0xff07AA59),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                CustomButton(
                  text: "Log In",
                  backgroundcolor: Color(0xff26864E),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    "----------------------OR----------------------",
                    style: TextStyle(
                      color: Color(0xff6C7278),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 8),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: Color(0xff6C7278),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignupView()),
                        );
                      },
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                          color: Color(0xff07AA59),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
