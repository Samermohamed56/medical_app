import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popupsuccess extends StatelessWidget {
  const Popupsuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 50,
      shadowColor: CupertinoColors.inactiveGray,
      backgroundColor: Colors.white,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
      actions: [
        SizedBox(height: 75),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset("assets/pop.png"),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
