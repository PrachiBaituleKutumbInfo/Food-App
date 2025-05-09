import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconHeadingRow extends StatelessWidget {
  final String? iconAssetPath;
  final String heading;
  final double iconSize;
  final TextStyle? textStyle;
  final double spacing;

  const IconHeadingRow({
    super.key,
     this.iconAssetPath,
    required this.heading,
    this.iconSize = 24.0,
    this.textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (iconAssetPath != null && iconAssetPath!.isNotEmpty)
            SvgPicture.asset(
              iconAssetPath!,
              width: iconSize,
              height: iconSize,
            ),
          if (iconAssetPath != null && iconAssetPath!.isNotEmpty)
            SizedBox(width: spacing),
          Text(
            heading,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}