import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/coupon&offers_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/faq_list_widget.dart';

class CustomerSupportsScreen extends StatelessWidget {
  const CustomerSupportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Customer Support & FAQ's",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 164, 104, 13),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 244, 243, 243),
                        ),
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Divider
            Container(
              height: 1.5,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 139, 137, 137)
                        .withOpacity(0.5),
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Items in your cart
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Items in your cart',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),

            /// Order Cards
            ..._orderItems(),

            const SizedBox(height: 20),

            /// FAQs
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "FAQ's",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FAQCategoryList(
              items: [
                'Coupons and Offers',
                'General Inquiry',
                'Payments',
                'Orders',
                'Feedback',
              ],
              onItemTap: (item) {
                if (item == 'Coupons and Offers') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CouponsAndOffersScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$item clicked')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Dummy order cards
  static List<Widget> _orderItems() {
    return [
      _orderCard(
        status: "Payment Failed",
        icon: Icons.error_outline,
        iconColor: Colors.red,
        date: "7th Sep 2024, 4:05 PM",
        price: "₹420",
      ),
      _orderCard(
        status: "Order Delivered",
        icon: Icons.check_circle_outline,
        iconColor: Colors.green,
        date: "8th Sep 2024, 12:00 PM",
        price: "₹380",
      ),
      _orderCard(
        status: "Order Delivered",
        icon: Icons.check_circle_outline,
        iconColor: Colors.green,
        date: "9th Sep 2024, 8:30 AM",
        price: "₹520",
      ),
    ];
  }

  /// Order card widget
  static Widget _orderCard({
    required String status,
    required IconData icon,
    required Color iconColor,
    required String date,
    required String price,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF5F9FF),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Left side: Status + date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      status,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(icon, color: iconColor),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),

            /// Right side: Price + Arrow
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.black54),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
