import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/dashboard_screen/dashboard_home_screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 5),
              child: Row(
                children: [
                  /// Back button on the left
                  CircularBackButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardHomeScreen(),
                      ),
                    ),
                  ),

                  /// Centered title
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: HeaderTitle(
                        title: 'Privacy Policy',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const HeaderShadowDivider(), // Use the HeaderShadowDivider here
            const SizedBox(height: 30),
            const Center(child: Text('Privacy Policy', style: AppTextStyle.largeTitleRegular,))

        ]
        ),
      ),
    );
  }
}
