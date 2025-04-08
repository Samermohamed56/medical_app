import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/data/repo/auth/auth_repository.dart';
import 'package:medical/data/service/api_service.dart';
import 'package:medical/view%20model/cubit/login_cubit.dart';
import 'package:medical/view/home/home%20page/home_view.dart';
import 'package:medical/view/widgets/custem_button.dart';
import 'package:medical/view/widgets/custom_text_field.dart';
import 'package:medical/view/widgets/dont_have_account.dart';
import 'widgets/remember_and_forgot.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? v) {
    if (v == null || v.isEmpty) return 'Please enter your email';
    final pattern = r'^[^@]+@[^@]+\.[^@]+';
    if (!RegExp(pattern).hasMatch(v)) return 'Please enter a valid email';
    return null;
  }

  String? validatePassword(String? v) {
    if (v == null || v.isEmpty) return 'Please enter your password';
    if (v.length < 6) return 'Password must be at least 6 chars';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(ApiService().dio),
      child: BlocProvider(
        create: (ctx) => LoginCubit(ctx.read<AuthRepository>()),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeView()),
              );
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is LoginLoading;
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
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
                            const Text(
                              "Sign in to your Account",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "Enter your email and password to log in",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6C7278)),
                            ),
                            const SizedBox(height: 24),
                            CustemTextField(
                              controller: emailController,
                              hintText: "email",
                              isPassword: false,
                              validator: validateEmail,
                            ),
                            CustemTextField(
                              controller: passwordController,
                              hintText: "password",
                              isPassword: true,
                              validator: validatePassword,
                            ),
                            const SizedBox(height: 8),
                            const RememberAndForgot(),
                            const SizedBox(height: 16),
                            isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : CustomButton(
                                    text: "Log In",
                                    backgroundcolor: const Color(0xff26864E),
                                    onPressed: () {
                                      if (_formKey.currentState!
                                          .validate()) {
                                        context.read<LoginCubit>().login(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text,
                                            );
                                      }
                                    },
                                  ),
                            const SizedBox(height: 16),
                            const DontHaveAccount(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
