import 'package:flutter/material.dart';
import 'package:medical/home/product%20details/product_view.dart';
import 'package:medical/settings/settings/settings_view.dart';
import 'package:medical/widgets/custom_text_field.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Color(0xff6C7278),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "pick up from AL Salam-Al Maadi",
                        style: TextStyle(color: Color(0xff6C7278)),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Shop by category",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    TextButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff07AA59),
                      ),
                      onPressed: () {},
                      label: Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xff07AA59),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryAvatar(
                      image: "assets/medicen.png",
                      title: "First Aid",
                    ),
                    CategoryAvatar(image: "assets/kids.png", title: "For Kids"),
                    CategoryAvatar(
                      image: "assets/cold.png",
                      title: "Cold And Flue",
                    ),
                    CategoryAvatar(
                      image: "assets/pregnant.png",
                      title: "For Pregnant",
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Popular Medicines",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.78,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductView(),
                            ),
                          );
                        },
                        child: CustumCard(),
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryAvatar extends StatelessWidget {
  const CategoryAvatar({super.key, required this.image, required this.title});
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: Colors.transparent,
          child: Image.asset(image),
        ),
        Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class CustumCard extends StatelessWidget {
  const CustumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/med.png"),
                ),
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.black),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            Text(
              "200 EGP",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: const Color.fromARGB(255, 255, 0, 0),
              ),
            ),
            Row(
              children: [
                Text(
                  "230 EGP",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xff6C7278),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "20% off",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: const Color.fromARGB(255, 0, 38, 255),
                  ),
                ),
              ],
            ),
            Text(
              "Panadol Cold and Flu",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
