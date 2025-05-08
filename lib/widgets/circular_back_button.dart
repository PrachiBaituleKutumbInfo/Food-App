import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CircularBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CircularBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightBlueGrey,
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.deepNavy),
        onPressed: onPressed,
      ),
    );
  }
}
