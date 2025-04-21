import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/cancel_order_dialog.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/feedback_bottom_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_tracking_Map_Screen.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: SizedBox(
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Order History',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 164, 104, 13),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 244, 243, 243),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1.5,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: const [
                OrderCard(
                  status: 'Order Inprocess',
                  date: '9th Sep 2024, 8:30 AM',
                  amount: '₹520',
                  items: [
                    {'text': '1 x Mexican Wave Pizza', 'veg': false},
                    {'text': '1 x Paneer Tikka Pizza', 'veg': true},
                    {'text': '1 x Peri-Peri Chicken Pizza', 'veg': false},
                  ],
                  actions: ['Cancel', 'Track Order'],
                ),
                OrderCard(
                  status: 'Payment Failed',
                  date: '7th Sep 2024, 4:05 PM',
                  amount: '₹420',
                  items: [
                    {'text': '1 x Chicken Pepperoni Pizza', 'veg': false},
                    {'text': '1 x Vegetarian Margherita Pizza', 'veg': true},
                    {'text': '1 x Classic Veg Pizza', 'veg': true},
                  ],
                  actions: ['Feedback', 'Reorder'],
                ),
                OrderCard(
                  status: 'Order Delivered',
                  date: '8th Sep 2024, 12:00 PM',
                  amount: '₹380',
                  items: [
                    {'text': '1 x Classic Margherita Pizza', 'veg': true},
                    {'text': '1 x Spicy Chicken Pizza', 'veg': false},
                    {'text': '1 x Cheese Burst Pizza', 'veg': true},
                  ],
                  actions: ['Feedback', 'Reorder'],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
        color: const Color.fromARGB(255, 229, 241, 248),
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
                            ? const Color.fromARGB(255, 251, 237, 237)
                            : Colors.deepOrange,
                    foregroundColor:
                        (action == 'Cancel' || action == 'Feedback')
                            ? Colors.deepOrange
                            : Colors.white,
                    side: (action == 'Cancel' || action == 'Feedback')
                        ? const BorderSide(color: Colors.deepOrange)
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
