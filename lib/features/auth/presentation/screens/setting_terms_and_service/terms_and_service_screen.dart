import 'package:flutter/material.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';

class TermsAndServiceScreen extends StatelessWidget {
  const TermsAndServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Header
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
                      title: 'Terms of Service',
                    ),
                  ),
                ),
              ],
            ),
          ),
      
          const HeaderShadowDivider(), // Use the HeaderShadowDivider here
      
          const SizedBox(height: 20),
      
          /// Terms Sections
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSection("I. Acceptance of terms",
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry..."),
                  buildSection("II. Definitions",
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry..."),
                  buildSection("III. Payment Information",
                      "Please enter your payment information to proceed with the purchase."),
                  buildSection("IV. Shipping Address",
                      "Please provide your shipping address for delivery."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section builder function
  Widget buildSection(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
