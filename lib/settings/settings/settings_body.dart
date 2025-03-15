import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/settings/account%20details/account_details_view.dart';
import 'package:medical/settings/history/history_view.dart';
import 'package:medical/settings/notification/notification_view.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(115, 255, 255, 255),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(FontAwesomeIcons.chevronLeft, color: Colors.black),
                ),
                SizedBox(width: 24),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "ahmed shehata",
                      style: TextStyle(
                        color: Color(0xff131F46),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "+20 1212186636",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff888FA0),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/mahmod.png"),
                    ),
                    Positioned(
                      bottom: -15,
                      child: IconButton(
                        iconSize: 24,
                        color: Color(0xff1B5E37),
                        onPressed: () {},
                        icon: Icon(Icons.camera_alt_outlined),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 48),
            Text(
              "Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "Language",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                Spacer(),
                Text(
                  "English",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(width: 12),
                Icon(FontAwesomeIcons.chevronRight, color: Color(0xff000000)),
              ],
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationView()),
                );
              },
              child: Row(
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                  Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Color(0xff1B5E37),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                Spacer(),
                Switch(
                  value: false,
                  onChanged: (value) {},
                  activeColor: Color(0xff1B5E37),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Privacy",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountDetailsView()),
                );
              },
              child: Row(
                children: [
                  Text(
                    "Account Details",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                  Spacer(),
                  Icon(FontAwesomeIcons.chevronRight, color: Color(0xff000000)),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "Favorites",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                Spacer(),
                Icon(FontAwesomeIcons.chevronRight, color: Color(0xff000000)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "Payment Methods",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
                Spacer(),
                Icon(FontAwesomeIcons.chevronRight, color: Color(0xff000000)),
              ],
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryView()),
                );
              },
              child: Row(
                children: [
                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                  Spacer(),
                  Icon(FontAwesomeIcons.chevronRight, color: Color(0xff000000)),
                ],
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Delete Account",
                  style: TextStyle(
                    color: Color(0xffD97474),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Eng.Samer",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: const Color.fromARGB(255, 0, 0, 0),
                decorationThickness: 1.0,
              ),
            ),
            Text(
              "Version 1.0 April, 2025",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
