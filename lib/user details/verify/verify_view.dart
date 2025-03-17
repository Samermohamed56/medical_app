import 'package:flutter/material.dart';
import 'package:medical/user%20details/verify/verify_body.dart';
import 'package:medical/widgets/custom_view.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
   return CustomView(body: VerifyBody());
  }
}
