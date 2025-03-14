import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/user%20details/login/login_view.dart';
import 'package:medical/user%20details/new%20password/new_passowrd_view.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:pinput/pinput.dart';

class VerifyBody extends StatelessWidget {
  const VerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            "verification code.",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12),

          Text(
            "Enter the code we sent to the following email address: Mahxxxxx4@email.com",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xff6C7278),
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Pinput(
                  keyboardType: TextInputType.number,
                  animationCurve: Curves.easeInQuart,
                  animationDuration: Duration(milliseconds: 300),
                  autofocus: true,
                  closeKeyboardWhenCompleted: true,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  defaultPinTheme: PinTheme(
                    textStyle: TextStyle(fontSize: 22),
                    width: 74,

                    constraints: BoxConstraints(maxWidth: 50, maxHeight: 50),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 24),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewPassowrdView()),
              );
            },
            text: "Verify the code",
            backgroundcolor: Color(0xff26864E),
          ),
          SizedBox(height: 12),
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Resend verification code",
                style: TextStyle(
                  color: Color(0xff07AA59),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
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
    );
  }
}
