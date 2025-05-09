import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class FAQCategoryList extends StatelessWidget {
  final List<String> items;
  final void Function(String item)? onItemTap;

  const FAQCategoryList({
    super.key,
    required this.items,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.softBlue),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          children: items.map((item) {
            return Column(
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.steelBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => onItemTap?.call(item),
                ),
                const Divider(height: 1),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
