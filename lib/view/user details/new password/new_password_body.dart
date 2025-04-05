import 'package:flutter/material.dart';
import 'package:medical/view/user%20details/new%20password/popupsuccess.dart';
import 'package:medical/view/widgets/already_have_an_account.dart';
import 'package:medical/view/widgets/custem_button.dart';
import 'package:medical/view/widgets/custom_appbar.dart';
import 'package:medical/view/widgets/custom_text_field.dart';

class NewPasswordBody extends StatelessWidget {
  const NewPasswordBody({super.key});

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
                CustemTextField(
                  hintText: "re-enter password ",
                  isPassword: true,
                ),
                SizedBox(height: 24),
                CustomButton(
                  text: "create new password",
                  backgroundcolor: Color(0xff26864E),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.transparent,
                      builder: (context) {
                        return Popupsuccess();
                      },
                    );
                  },
                ),
                SizedBox(height: 200),
                AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
