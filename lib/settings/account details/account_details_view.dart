import 'package:flutter/material.dart';
import 'package:medical/constance.dart';
import 'package:medical/settings/account%20details/account_details_body.dart';

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,

          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              colors: Constance.backgroundColor,
            ),
          ),
          child: AccountDetailsBody(),
        ),
      ),
    );
  }
}