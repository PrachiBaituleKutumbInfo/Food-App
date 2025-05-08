import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_details_card_widget.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 5),
              child: Row(
                children: [
                  /// Back button on the left
                  CircularBackButton(
                      onPressed: () => Navigator.pop(context),
                  ),

                  /// Centered title
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: HeaderTitle(
                        title: 'Order History',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const HeaderShadowDivider(), // Use the HeaderShadowDivider here
          
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
