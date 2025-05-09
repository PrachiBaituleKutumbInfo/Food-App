import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/terms_of_service/terms_heading_widgets.dart';
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
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TermsHeadingDescription(
                      title: "I. Acceptance of terms",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry..."),
                  TermsHeadingDescription(
                      title: "II. Definitions",
                      description:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry..."),
                  TermsHeadingDescription(
                      title: "III. Payment Information",
                      description:
                          "Please enter your payment information to proceed with the purchase."),
                  TermsHeadingDescription(
                      title: "IV. Shipping Address",
                      description:
                          "Please provide your shipping address for delivery."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
