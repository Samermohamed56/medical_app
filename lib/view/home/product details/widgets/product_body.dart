import 'package:flutter/material.dart';
import 'package:medical/view/home/product%20details/widgets/images_slider.dart';
import 'package:medical/view/home/product%20details/widgets/product_details.dart';

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
        ImagesSlider(images: images),
        ProductDetails(
          medName: "Cateflamin 500 mg tablet",
          medMG: "50 mg",
          medPills: "20 pills",
          medInfo:
              "Cataflam is a non-steroidal anti-inflammatory drug (NSAID) used for the relief of pain, inflammation, and swelling. It contains diclofenac potassium, which works by inhibiting enzymes (COX-1 and COX-2) responsible for producing pain-inducing chemicals called prostaglandins.",
        ),
      ],
    );
  }
}
