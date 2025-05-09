import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/cancel_order_dialog.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/feedback_bottom_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_tracking_Map_Screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class OrderCard extends StatelessWidget {
  final String status;
  final String date;
  final String amount;
  final List<Map<String, dynamic>> items;
  final List<String> actions;

  const OrderCard({
    super.key,
    required this.status,
    required this.date,
    required this.amount,
    required this.items,
    required this.actions,
  });

  void showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CancelDialog(),
    );
  }

  void showFeedbackBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => const FeedbackBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
         color: AppColors.lightBlueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(date),
              const Spacer(),
              Row(
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.arrow_forward_ios, size: 14),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          ...items.map((item) => Row(
                children: [
                  SvgPicture.asset(
                    item['veg']
                        ? 'assets/svgicons/veg-category.svg'
                        : 'assets/svgicons/non-veg-category.svg',
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(width: 5),
                  Expanded(child: Text(item['text'])),
                ],
              )),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: actions.map((action) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: () {
                    if (action == 'Cancel') {
                      showCancelDialog(context);
                    } else if (action == 'Feedback') {
                      showFeedbackBottomSheet(context);
                    } else if (action == 'Track Order') {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderTrackingScreen()));
                    } else if (action == 'Reorder') {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        (action == 'Cancel' || action == 'Feedback')
                            ? AppColors.peachBackground
                            : AppColors.primary,
                    foregroundColor:
                        (action == 'Cancel' || action == 'Feedback')
                            ? AppColors.primary
                            : Colors.white,
                    side: (action == 'Cancel' || action == 'Feedback')
                        ? const BorderSide(color: AppColors.primary)
                        : BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(action.toUpperCase()),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}