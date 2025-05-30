import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class AddressTypeButton extends StatelessWidget {
  final String type;
  final String assetPath;
  final bool isSelected;
  final bool isSvg;
  final VoidCallback onTap;

  const AddressTypeButton({
    super.key,
    required this.type,
    required this.assetPath,
    required this.isSelected,
    required this.onTap,
    this.isSvg = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: isSvg
            ? SvgPicture.asset(
                assetPath,
                width: 24,
                height: 24,
                // ignore: deprecated_member_use
                color: isSelected ? AppColors.primary : AppColors.darkBlue,
              )
            : Icon(
                Icons.location_on,
                color: isSelected ? AppColors.primary : AppColors.greyText,
              ),
        label: Text(
          type,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? AppColors.primary : Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? AppColors.peachBackground : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSelected ? AppColors.primary : AppColors.softBlue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
