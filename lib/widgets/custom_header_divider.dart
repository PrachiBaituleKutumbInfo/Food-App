import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';



class HeaderShadowDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double opacity;

  final double blurRadius;
  final double spreadRadius;
  final Offset offset;

  const HeaderShadowDivider({
    super.key,
    this.height = 1.5,
    this.color = AppColors.softBlue,
    this.opacity = 0.5,
    this.blurRadius = 5,
    this.spreadRadius = 10,
    this.offset = const Offset(0, 3),
  });

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color.withOpacity(opacity);

    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: effectiveColor,
          ),
        ),
      ),
    );
  }
}

 