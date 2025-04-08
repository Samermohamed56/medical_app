import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/view%20model/cubit/login_cubit.dart';
import 'package:medical/view/user%20details/signup/signup_view.dart';

void main() {
 
  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          
        ],
        child:
            MaterialApp(debugShowCheckedModeBanner: false, home: SignupView()));
  }
}
