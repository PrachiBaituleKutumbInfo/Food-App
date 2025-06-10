import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  

  const SectionTitle({
    super.key,
    required this.title,
   
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.largeTitleSemibold
        ),
      ],
    );
  }
}
