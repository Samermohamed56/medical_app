import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical/data/repo/auth/auth_repository.dart';
import 'package:medical/data/repo/map/map_repository.dart';
import 'package:medical/data/service/api_service.dart';
import 'package:medical/view%20model/cubit/cubit/signup_cubit.dart';
import 'package:medical/view%20model/cubit/login_cubit.dart';
import 'package:medical/view%20model/cubit/vending_machine_cubit.dart';
import 'package:medical/view/user%20details/login/login_view.dart';
import 'package:medical/view/user%20details/signup/signup_view.dart';

import 'view/home/home page/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService(); // تهيئة ApiService

  runApp(const MedicalApp());
}

class MedicalApp extends StatelessWidget {
  const MedicalApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepository(ApiService().dio);
    final vendingMachineRepo = VendingMachineRepository(ApiService().dio);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(value: authRepo),
        RepositoryProvider<VendingMachineRepository>.value(value: vendingMachineRepo,)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(context.read<AuthRepository>()),
          ),
          BlocProvider<SignupCubit>(
            create: (context) => SignupCubit(context.read<AuthRepository>()),
          ),
          BlocProvider(create: (context) => VendingMachineCubit(context.read<VendingMachineRepository>())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SignupView(),
          routes: {
            '/login': (_) => const LoginView(),
            '/signup': (_) => const SignupView(),
            '/home': (_) => const HomeView(),
          },
        ),
      ),
    );
  }
}
