import 'package:flutter/material.dart';
import 'package:medical/home/home%20page/widgets/category_avatar.dart';
import 'package:medical/home/home%20page/widgets/custom_card.dart';
import 'package:medical/home/home%20page/widgets/search_home_view.dart';
import 'package:medical/home/product%20details/product_view.dart';

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
                SearchHomeView(),
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
