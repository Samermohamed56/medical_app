import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/user%20details/login/login_view.dart';
import 'package:medical/user%20details/new%20password/popupsuccess.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_text_field.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

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
            "new password",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12),

          Text(
            "Type your strong password.",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: Color(0xff6C7278),
            ),
          ),
          SizedBox(height: 24),

          CustemTextField(hintText: "password", isPassword: true),
          CustemTextField(hintText: "re-enter password ", isPassword: true),

          SizedBox(height: 24),
          CustomButton(
            text: "create new password",
            backgroundcolor: Color(0xff26864E),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Popupsuccess()),
              // );
              showDialog(context: context,barrierColor: Colors.transparent, builder: (context) {
                return Popupsuccess();
              },);
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
    );
  }
}
