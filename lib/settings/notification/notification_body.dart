import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "refill",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "arkane mall-El sheikh zaid has only 1 panadol left",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Image.asset("assets/word.png"),
                                SizedBox(width: 5),
                                Text(
                                  "Design brief and ideas.txt",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "2.2 MB",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6C7278),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              "2 mins ago",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C7278),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),

                        Column(
                          children: [
                            Text(
                              "15h",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C7278),
                              ),
                            ),
                            Icon(FontAwesomeIcons.ellipsis),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "succesfull purchase",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "in must university machine",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Image.asset("assets/word.png"),
                                SizedBox(width: 5),
                                Text(
                                  "invoice.txt",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "2.2 MB",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff6C7278),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              "59 mins ago",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C7278),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),

                        Column(
                          children: [
                            Text(
                              "15h",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C7278),
                              ),
                            ),
                            Icon(FontAwesomeIcons.ellipsis),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text("data"),
        Text("data"),
      ],
    );
  }
}
