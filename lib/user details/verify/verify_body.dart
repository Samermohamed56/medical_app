import 'package:flutter/material.dart';
import 'package:medical/user%20details/new%20password/new_passowrd_view.dart';
import 'package:medical/widgets/already_have_an_account.dart';
import 'package:medical/widgets/custem_button.dart';
import 'package:medical/widgets/custom_appbar.dart';
import 'package:pinput/pinput.dart';

class VerifyBody extends StatelessWidget {
  const VerifyBody({super.key});

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
                SizedBox(),

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

                          constraints: BoxConstraints(
                            maxWidth: 50,
                            maxHeight: 50,
                          ),
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
                      MaterialPageRoute(
                        builder: (context) => NewPassowrdView(),
                      ),
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
