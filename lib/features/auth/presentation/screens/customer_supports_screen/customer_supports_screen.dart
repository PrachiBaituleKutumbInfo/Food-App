import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/coupon&offers_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/faq_list_widget.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/status_details_cart_widget.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_history_screen.dart';

class CustomerSupportsScreen extends StatelessWidget {
  const CustomerSupportsScreen({super.key});

  static List<Widget> _orderItems() {
    return [
      const StatusDetailsCartWidget(
        status: "Payment Failed",
        icon: Icons.error_outline,
        iconColor: Colors.red,
        date: "7th Sep 2024, 4:05 PM",
        price: "₹420",
      ),
    const  StatusDetailsCartWidget(
        status: "Order Delivered",
        icon: Icons.check_circle_outline,
        iconColor: Colors.green,
        date: "8th Sep 2024, 12:00 PM",
        price: "₹380",
      ),
     const StatusDetailsCartWidget(
        status: "Order Delivered",
        icon: Icons.check_circle_outline,
        iconColor: Colors.green,
        date: "9th Sep 2024, 8:30 AM",
        price: "₹520",
      ),
    ];
  }

  final List<String> categories = const [
    'Coupons and Offers',
    'General Inquiry',
    'Payments',
    'Orders',
    'Feedback',
  ];
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
                    // ignore: deprecated_member_use
                    const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 139, 137, 137)
                        // ignore: deprecated_member_use
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
              items: categories,
              onItemTap: (item) {
                if (item == 'Coupons and Offers') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => CouponsAndOffersScreen()));
                } else if (item == 'General Inquiry') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const GeneralInquiryScreen()));
                } else if (item == 'Payments') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const PaymentsScreen()));
                } else if (item == 'Orders') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const OrderHistoryScreen()));
                } else if (item == 'Feedback') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const FeedbackScreen()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('$item clicked')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
 