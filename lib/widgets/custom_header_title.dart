import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';

class HeaderTitle extends StatelessWidget {
  final String title;


  const HeaderTitle({
    super.key,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.title1Medium,
        ),
      ),
    );
  }
}
