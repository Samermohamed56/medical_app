import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical/widgets/custem_button.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({super.key});
  static const List<String> images = [
    "assets/med.png",
    "assets/med2.png",
    "assets/medicen.png",
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            color: Colors.white60,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 24),
                  CarouselSlider(
                    items: images.map((e) => Image.asset(e)).toList(),
                    options: CarouselOptions(
                      pageSnapping: true,
                      enableInfiniteScroll: false,
                      animateToClosest: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayInterval: const Duration(seconds: 3),
                      pauseAutoPlayOnTouch: true,
                      pauseAutoPlayOnManualNavigate: true,

                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cateflamin 500 mg tablet",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "50 mg",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff6C7278),
                  ),
                ),
                SizedBox(height: 12),
                Text("20 pills"),
                SizedBox(height: 12),
                SpinBox(
                  incrementIcon: Icon(
                    FontAwesomeIcons.plus,
                    color: Color.fromARGB(255, 10, 187, 10),
                  ),
                  decrementIcon: Icon(
                    FontAwesomeIcons.minus,
                    color: Color.fromARGB(255, 255, 0, 0),
                  ),
                  min: 1,
                  textStyle: TextStyle(color: Colors.black, fontSize: 20),
                  max: 100,
                  value: 1,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Product details",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 12),
                Text(
                  "Cataflam is a non-steroidal anti-inflammatory drug (NSAID) used for the relief of pain, inflammation, and swelling. It contains diclofenac potassium, which works by inhibiting enzymes (COX-1 and COX-2) responsible for producing pain-inducing chemicals called prostaglandins.",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6C7278),
                  ),
                ),
                SizedBox(height: 32),
                CustomButton(
                  text: "Add to cart",
                  backgroundcolor: Color(0xff26864E),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
