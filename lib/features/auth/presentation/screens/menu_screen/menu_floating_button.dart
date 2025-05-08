// file: widgets/corner_menu_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CornerMenuBottomSheet {
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black54, // optional dim background
      builder: (context) {
        return Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 75), // just above FAB
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              decoration: BoxDecoration(
                color: AppColors.deepNavy,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Our Menu",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...[
                    {'title': 'Pizza', 'count': 4},
                    {'title': 'Burgers', 'count': 6},
                    {'title': 'Biryani', 'count': 4},
                    {'title': 'Roti and paratha', 'count': 5},
                    {'title': 'Sides', 'count': 7},
                    {'title': 'Cold Drinks', 'count': 5},
                    {'title': 'Tiffin Service', 'count': 2},
                  ].map((item) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item['title'].toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Text(
                          item['count'].toString(),
                          style: const TextStyle(color: Colors.white70),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          // You can add onTap logic for scrolling/filtering
                        },
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
