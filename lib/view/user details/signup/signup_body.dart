import 'package:flutter/material.dart';
import 'package:medical/view/home/home%20page/home_view.dart';
import 'package:medical/view/widgets/already_have_an_account.dart';
import 'package:medical/view/widgets/custem_button.dart';
import 'package:medical/view/widgets/custom_text_field.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController roleController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
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
                  CustemTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your username";
                      } else if (p0.length < 3) {
                        return "username must be at least 3 characters long";
                      } else {
                        return null;
                      }
                    },
                    hintText: "username",
                    isPassword: false,
                    controller: usernameController,
                  ),
                  CustemTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your phone number";
                      } else if (p0.length < 9) {
                        return "phone number must be at least 9 characters long";
                      } else {
                        return null;
                      }
                    },
                    hintText: "phone",
                    isPassword: false,
                    controller: phoneController,
                  ),
                  CustemTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your email";
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(p0)) {
                        return "please enter a valid email address";
                      } else {
                        return null;
                      }
                    },
                    hintText: "email",
                    isPassword: false,
                    controller: emailController,
                  ),
                  CustemTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your age";
                      } else if (int.tryParse(p0) == null) {
                        return "please enter a valid age";
                      } else if (int.parse(p0) < 10) {
                        return "you must be at least 10 years old";
                      } else {
                        return null;
                      }
                    },
                    hintText: "age",
                    isPassword: false,
                    controller: ageController,
                  ),
                  CustemTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your password";
                      } else if (p0.length < 6) {
                        return "password must be at least 6 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character";
                      } else {
                        return null;
                      }
                    },
                    hintText: "password",
                    isPassword: true,
                    controller: passwordController,
                  ),
                  CustemTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "please enter your role";
                      } else if (p0 == "Customer" || p0 == "Admin") {
                        return "please enter a valid role (Customer or Admin)";

                      } else {
                        return null;
                      }
                    },
                      hintText: "role",
                      isPassword: false,
                      controller: roleController),
                  SizedBox(height: 24),
                  CustomButton(
                    text: "Register",
                    backgroundcolor: Color(0xff26864E),
                    onPressed: () 
                    {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ));
                    },
                  ),
                  SizedBox(height: 100),
                  AlreadyHaveAnAccount(),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
