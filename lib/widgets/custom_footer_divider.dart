import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class FooterShadowDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double opacity;
  final double blurRadius;
  final double spreadRadius;
  final Offset offset;

  const FooterShadowDivider({
    super.key,
    this.height = 1,
    this.color = AppColors.softBlue,
    this.opacity = 0.5,
    this.blurRadius = 10,
    this.spreadRadius = 5,
    this.offset = const Offset(0, -3), // Shadow goes upward
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color.withOpacity(opacity);

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: effectiveColor,
        boxShadow: [
          BoxShadow(
            color: effectiveColor,
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
            offset: offset,
          ),
        ],
      ),
    );
  }
}