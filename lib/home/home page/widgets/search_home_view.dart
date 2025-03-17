import 'package:flutter/material.dart';
import 'package:medical/settings/settings/settings_view.dart';
import 'package:medical/widgets/custom_text_field.dart';

class SearchHomeView extends StatelessWidget {
  const SearchHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    Expanded(
                      child: CustemTextField(
                        hintText: "Search",
                        isPassword: false,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      child: Image.asset("assets/mahmod.png", width: 50),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsView(),
                          ),
                        );
                      },
                    ),
                  ],
                );
  }
}