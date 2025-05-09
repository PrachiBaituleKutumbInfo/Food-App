import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/faq_list_widget.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_tracking_Map_Screen.dart';

class CouponsAndOffersScreen extends StatelessWidget {
  CouponsAndOffersScreen({super.key});

  final List<String> faqItems = [
    'Coupon not working/expired coupon',
    'I forgot to apply my coupon code. What do I do now?',
    'How do I refer my friend?',
    'How to track my order status?',
    'What payment methods are accepted?',
    'Can I cancel my order after placing it?',
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
                        "FAQ's",
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

            const SizedBox(height: 20),

            /// Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Coupons and Offers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// FAQ List
            FAQCategoryList(
              items: faqItems,
              onItemTap: (item) {
                if (item == 'Coupon not working/expired coupon') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const CouponIssueScreen()));
                } else if (item ==
                    'I forgot to apply my coupon code. What do I do now?') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const CouponHelpScreen()));
                } else if (item == 'How do I refer my friend?') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const ReferralScreen()));
                } else if (item == 'How to track my order status?') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const OrderTrackingScreen()));
                } else if (item == 'What payment methods are accepted?') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const PaymentMethodsScreen()));
                } else if (item == 'Can I cancel my order after placing it?') {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => const CancellationPolicyScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tapped: $item')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
