import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/faq_list_widget.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      title: 'Get Help',
                    ),
                  ),
                ),
              ],
            ),
          ),

          const HeaderShadowDivider(), // Use the HeaderShadowDivider here

          const SizedBox(height: 20),

          /// Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Need help with this order?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          /// FAQ List
          FAQCategoryList(
            items: const [
              "Need help with food delivered?",
              "Food quality was not good?",
              "Do you have food quantity issue?",
              "Packaging or spillage issue?",
              "I have not received my order?",
            ],
            onItemTap: (item) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$item clicked')),
              );
            },
          ),

          const SizedBox(height: 30),

          /// Get Help Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Get Help",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Still need support?\nWe are available 9am - 9pm",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                buildChatButton(),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Chat Button Widget
  Widget buildChatButton() {
    return SizedBox(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
        label: const Text(
          "CHAT WITH US",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          // Handle chat action
        },
      ),
    );
  }
}
