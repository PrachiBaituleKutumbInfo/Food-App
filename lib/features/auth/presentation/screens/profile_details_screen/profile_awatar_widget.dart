import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class ProfileInfoRow extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String avatarAssetPath;
  final double avatarRadius;
  final double iconSize;

  const ProfileInfoRow({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatarAssetPath,
    this.avatarRadius = 40,
    this.iconSize = 90,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundColor: AppColors.steelBlue,
          child: SvgPicture.asset(
            avatarAssetPath,
            width: iconSize,
            height: iconSize,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(email),
            Text(phone),
          ],
        ),
      ],
    );
  }
}
