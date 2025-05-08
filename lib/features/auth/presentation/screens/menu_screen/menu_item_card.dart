import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';

class MenuItemCard extends StatelessWidget {
  final Map<String, String> item;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onTap;
  final Widget quantityWidget;

  const MenuItemCard({
    super.key,
    required this.item,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onTap,
    required this.quantityWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item["image"]!,
                  width: 160,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -30,
                left: 25,
                right: 25,
                child: quantityWidget,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    item["category"] == "veg"
                        ? 'assets/svgicons/veg-category.svg'
                        : 'assets/svgicons/non-veg-category.svg',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    item["title"]!,
                    style: AppTextStyle.caption1,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item["price"]!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "${item["rating"]} ",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "(${item["reviews"]})",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    item["description"]!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.formLabel,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
