import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/data/repo/auth/auth_repository.dart';
import 'package:medical/data/service/api_service.dart';
import 'package:medical/view%20model/cubit/cubit/signup_cubit.dart';
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
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passwordController = TextEditingController();
  final roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(ApiService().dio),
      child: BlocProvider(
        create: (ctx) => SignupCubit(ctx.read<AuthRepository>()),
        child: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeView()),
              );
            } else if (state is SignupError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is SignupLoading;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Create an account to continue!",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff6C7278)),
                          ),
                          const SizedBox(height: 24),
                          CustemTextField(
                            controller: usernameController,
                            hintText: "username",
                            isPassword: false,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "please enter your username";
                              }
                              if (v.length < 3) {
                                return "username must be at least 3 chars";
                              }
                              return null;
                            },
                          ),
                          CustemTextField(
                            controller: phoneController,
                            hintText: "phone",
                            isPassword: false,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "please enter your phone";
                              }
                              if (v.length < 9) {
                                return "invalid phone number";
                              }
                              return null;
                            },
                          ),
                          CustemTextField(
                            controller: emailController,
                            hintText: "email",
                            isPassword: false,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "please enter your email";
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                                return "invalid email address";
                              }
                              return null;
                            },
                          ),
                          CustemTextField(
                            controller: ageController,
                            hintText: "age",
                            isPassword: false,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "please enter your age";
                              }
                              final n = int.tryParse(v);
                              if (n == null || n < 10) {
                                return "age must be 10+";
                              }
                              return null;
                            },
                          ),
                          CustemTextField(
                            controller: passwordController,
                            hintText: "password",
                            isPassword: true,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "please enter password";
                              }
                              if (v.length < 6) {
                                return "password too short";
                              }
                              return null;
                            },
                          ),
                          CustemTextField(
                            controller: roleController,
                            hintText: "role",
                            isPassword: false,
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return "please enter role";
                              }
                              if (v != "Customer" && v != "Admin") {
                                return "role must be Customer or Admin";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 24),
                          isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: "Register",
                                  backgroundcolor: const Color(0xff26864E),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignupCubit>().registerUser(
                                            username: usernameController.text,
                                            phone: phoneController.text,
                                            email: emailController.text,
                                            age: int.parse(ageController.text),
                                            password: passwordController.text,
                                            role: roleController.text,
                                          );
                                    }
                                  },
                                ),
                          const SizedBox(height: 100),
                          const AlreadyHaveAnAccount(),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
