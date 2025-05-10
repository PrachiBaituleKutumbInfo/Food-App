import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/dashboard_screen/dashboard_home_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_screen/menu_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_card_list_widgets.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_details_card_widget.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/orders_screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const DashboardHomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MenuScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const OrdersScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const CartScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
            child: OrderCardList(
              orders: [
                {
                  'status': 'Order Inprocess',
                  'date': '9th Sep 2024, 8:30 AM',
                  'amount': '₹520',
                  'items': [
                    {'text': '1 x Mexican Wave Pizza', 'veg': false},
                    {'text': '1 x Paneer Tikka Pizza', 'veg': true},
                    {'text': '1 x Peri-Peri Chicken Pizza', 'veg': false},
                  ],
                  'actions': ['Cancel', 'Track Order'],
                },
                {
                  'status': 'Payment Failed',
                  'date': '7th Sep 2024, 4:05 PM',
                  'amount': '₹420',
                  'items': [
                    {'text': '1 x Chicken Pepperoni Pizza', 'veg': false},
                    {'text': '1 x Vegetarian Margherita Pizza', 'veg': true},
                    {'text': '1 x Classic Veg Pizza', 'veg': true},
                  ],
                  'actions': ['Feedback', 'Reorder'],
                },
                {
                  'status': 'Order Delivered',
                  'date': '8th Sep 2024, 12:00 PM',
                  'amount': '₹380',
                  'items': [
                    {'text': '1 x Classic Margherita Pizza', 'veg': true},
                    {'text': '1 x Spicy Chicken Pizza', 'veg': false},
                    {'text': '1 x Cheese Burst Pizza', 'veg': true},
                  ],
                  'actions': ['Feedback', 'Reorder'],
                },
              ],
            ),
          )

          // Expanded(
          //   child: ListView(
          //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          //     children: const [
          //       OrderCard(
          //         status: 'Order Inprocess',
          //         date: '9th Sep 2024, 8:30 AM',
          //         amount: '₹520',
          //         items: [
          //           {'text': '1 x Mexican Wave Pizza', 'veg': false},
          //           {'text': '1 x Paneer Tikka Pizza', 'veg': true},
          //           {'text': '1 x Peri-Peri Chicken Pizza', 'veg': false},
          //         ],
          //         actions: ['Cancel', 'Track Order'],
          //       ),
          //       OrderCard(
          //         status: 'Payment Failed',
          //         date: '7th Sep 2024, 4:05 PM',
          //         amount: '₹420',
          //         items: [
          //           {'text': '1 x Chicken Pepperoni Pizza', 'veg': false},
          //           {'text': '1 x Vegetarian Margherita Pizza', 'veg': true},
          //           {'text': '1 x Classic Veg Pizza', 'veg': true},
          //         ],
          //         actions: ['Feedback', 'Reorder'],
          //       ),
          //       OrderCard(
          //         status: 'Order Delivered',
          //         date: '8th Sep 2024, 12:00 PM',
          //         amount: '₹380',
          //         items: [
          //           {'text': '1 x Classic Margherita Pizza', 'veg': true},
          //           {'text': '1 x Spicy Chicken Pizza', 'veg': false},
          //           {'text': '1 x Cheese Burst Pizza', 'veg': true},
          //         ],
          //         actions: ['Feedback', 'Reorder'],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
