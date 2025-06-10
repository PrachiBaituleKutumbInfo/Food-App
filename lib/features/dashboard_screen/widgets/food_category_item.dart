import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FoodCategoryIcon extends StatelessWidget {
  final String category; // "veg" or "non-veg"
  final double size;

  const FoodCategoryIcon({
    super.key,
    required this.category,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    String assetPath = category == "veg"
        ? 'assets/svgicons/veg-category.svg'
        : 'assets/svgicons/non-veg-category.svg';

    return SvgPicture.asset(
      assetPath,
      width: size,
      height: size,
    );
  }
}
