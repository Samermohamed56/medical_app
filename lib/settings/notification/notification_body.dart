import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        SingleChildScrollView(
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
                    Spacer(),
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
                    Spacer(),
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
        Center(child: Text("Remind Me Later Content")), // Default selected tab
        Center(child: Text("Unread Content")),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.controller});
  final TabController? controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2, // Small shadow
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {}, // Handle drawer open
          ),
          title: const Text(
            "app logo",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                "assets/profile.jpg",
              ), // Change to network image if needed
            ),
            const SizedBox(width: 10),
          ],
          bottom: TabBar(
            controller: controller,
            indicatorColor: Colors.green,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "All"),
              Tab(text: "remind me later"),
              Tab(text: "Unread"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("All Tab Content")),
            Center(child: Text("Remind Me Later Content")),
            Center(child: Text("Unread Content")),
          ],
        ),
      ),
    );
  }
}
