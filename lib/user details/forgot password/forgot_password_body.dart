import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/user%20details/login/login_view.dart';
import 'package:medical/user%20details/verify/verify_view.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_text_field.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(FontAwesomeIcons.chevronLeft, color: Colors.black),
              ),
              Expanded(flex: 1, child: SizedBox()),
        
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
              Expanded(flex: 5, child: SizedBox()),
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
              Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),]
    );
  }
}
