import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class AppTextStyle {
  static const TextStyle largeTitleRegular = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.darkBlue,
  );

  static const TextStyle largeTitleSemibold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w900,
    color: AppColors.goldenBrown,
  );

  static const TextStyle title1Regular = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title1Medium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryDark,
  );

  static const TextStyle title2Regular = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title2Medium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static TextStyle loginTitleMedium = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: AppColors.deepBlue,
  );

  static TextStyle title3Regular = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle title3Medium = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w500,
    color: AppColors.deepNavy,
  );

  static const TextStyle headline = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle body3 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle subhead = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle footnote = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle caption1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.darkBlue
  );

  static const TextStyle caption2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle formLabel = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w800, 
      color: AppColors.steelBlue);

  AppTextStyle(title1medium);
}
