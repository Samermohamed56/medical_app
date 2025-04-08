import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/view%20model/cubit/login_cubit.dart';
import 'package:medical/view/home/home%20page/home_view.dart';
import 'package:medical/view/user%20details/login/widgets/remember_and_forgot.dart';
import 'package:medical/view/widgets/custem_button.dart';
import 'package:medical/view/widgets/custom_text_field.dart';
import 'package:medical/view/widgets/dont_have_account.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();

  // الفاليديتور للبريد الإلكتروني
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regExp = RegExp(emailPattern);
    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // الفاليديتور للباسورد
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          // يمكنك إضافة loading indicator هنا إذا أردت
        } else if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Login successful")),
          );
          // الانتقال إلى الصفحة الرئيسية
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return GestureDetector(
          onTap: () {
            // عندما يتم لمس الشاشة في أي مكان غير الحقول يتم إخفاء التركيز
            FocusScope.of(context).unfocus();
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign in to your Account",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w700),
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
                        SizedBox(height: 24),
                        CustemTextField(
                          autoFocus: true,
                          hintText: "email",
                          isPassword: false,
                          controller: emailController,
                          focusNode: emailFocusNode, // إضافة focus node
                          validator: validateEmail,
                        ),
                        CustemTextField(
                          hintText: "password",
                          isPassword: true,
                          controller: passwordController,
                          validator: validatePassword,
                        ),
                        RememberAndForgot(),
                        SizedBox(height: 16),
                        isLoading
                            ? Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: "Log In",
                                backgroundcolor: Color(0xff26864E),
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    BlocProvider.of<LoginCubit>(context).login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Please fill in all fields correctly")),
                                    );
                                  }
                                },
                              ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            DontHaveAccount(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
