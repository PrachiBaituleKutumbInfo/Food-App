import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class AddressCard extends StatelessWidget {
  final Widget iconWidget;
  final String label;
  final String address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AddressCard({
    super.key,
    required this.iconWidget,
    required this.label,
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:AppColors.lightBlueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: onEdit,
                      icon: SvgPicture.asset(
                        'assets/svgicons/edit.svg',
                        width: 20,
                        height: 20,
                        // ignore: deprecated_member_use
                        color: AppColors.greyText,
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: SvgPicture.asset(
                        'assets/svgicons/trash-orange.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  address,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.greyText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
