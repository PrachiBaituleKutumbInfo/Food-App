import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class AppInfoBox extends StatelessWidget {
  final String message;
  final IconData? icon;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;

  const AppInfoBox({
    super.key,
    required this.message,
    this.icon,
    this.padding = const EdgeInsets.all(10),
    this.borderRadius = 10,
    this.textStyle = const TextStyle(color: AppColors.goldenBrown),
    this.backgroundColor = AppColors.deepOrange,
    this.borderColor = AppColors.amber,
    this.iconColor = AppColors.goldenBrown,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Colors.grey,
          width: 2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
