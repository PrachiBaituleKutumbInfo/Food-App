import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CategoryChip extends StatelessWidget {
  final String categoryKey;
  final String categoryLabel;
  final bool isSelected;
  final int selectedCount;
  final VoidCallback onSelect;
  final VoidCallback onRemove;

  const CategoryChip({
    super.key,
    required this.categoryKey,
    required this.categoryLabel,
    required this.isSelected,
    required this.selectedCount,
    required this.onSelect,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.peachBackground
              : AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.softBlue,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              categoryLabel,
              style: TextStyle(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.oliveGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  if (selectedCount > 1) {
                    onRemove();
                  }
                },
                child: const Icon(Icons.close, size: 18, color: AppColors.primary),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
