
import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CustomActionButton extends StatelessWidget {
  final bool isEnable;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? disabledBackgroundColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final double fontSize;
  final Widget? icon;
  final double iconSpacing;
  final MainAxisAlignment alignment;

  const CustomActionButton({
    super.key,
    required this.isEnable,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.disabledBackgroundColor,
    this.borderColor,
    required this.onPressed,
    this.fontSize = 18,
    this.icon,
    this.iconSpacing = 10,
    this.alignment = MainAxisAlignment.center,
  });

  /// 1. Orange background with disabled validation
  factory CustomActionButton.orangeFilled({
    required String text,
    required bool isEnable,
    required VoidCallback onPressed,
  }) {
    return CustomActionButton(
      text: text,
      isEnable: isEnable,
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
      textColor: AppColors.white,
    );
  }

  /// 2. Orange border with icon (always enabled)
  factory CustomActionButton.orangeBorderWithIcon({
    required String text,
    required Widget icon,
    required VoidCallback onPressed,
    MainAxisAlignment alignment = MainAxisAlignment.center,
  }) {
    return CustomActionButton(
      text: text,
      isEnable: true,
      onPressed: onPressed,
      backgroundColor: AppColors.offWhite,
      borderColor: AppColors.primary,
      textColor: AppColors.primary,
      icon: icon,
      alignment: alignment,
    );
  }

  /// 3. Green background button (always enabled)
  factory CustomActionButton.greenFilled({
    required String text,
    required VoidCallback onPressed,
  }) {
    return CustomActionButton(
      text: text,
      isEnable: true,
      onPressed: onPressed,
      backgroundColor: AppColors.success,
      textColor: AppColors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isEnable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnable
              ? backgroundColor
              : (disabledBackgroundColor ?? backgroundColor.withOpacity(0.5)),
          disabledBackgroundColor:
              disabledBackgroundColor ?? backgroundColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisAlignment: alignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) SizedBox(width: iconSpacing),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
