import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/address_detail_screen/address_details_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/customer_supports_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/paymnet_screen/payment_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/edit_personal_info_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_history_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_awatar_widget.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_tile.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/setting_terms_and_service/settings_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/terms_of_service/terms_and_service_screen.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: CircularBackButton(
              onPressed: () => Navigator.pop(context),
            )),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ✅ Profile Header
            const ProfileInfoRow(
              name: 'Deven Parab',
              email: 'devenparab@gmail.com',
              phone: '+91 9876543210',
              avatarAssetPath: 'assets/svgicons/profile-icon.svg',
            ),

           

            const SizedBox(height: 30),

            // ✅ Sections using SectionContainer + ProfileTile
            SectionContainer(
              children: [
                ProfileTile(
                  iconWidget: SvgPicture.asset('assets/svgicons/person.svg'),
                  title: "Personal Info",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PersonalInfoScreen(),
                      ),
                    );
                  },
                ),
                ProfileTile(
                  iconWidget: SvgPicture.asset('assets/svgicons/address.svg'),
                  title: "Addresses",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AddressDetailsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SectionContainer(
              children: [
                ProfileTile(
                  iconWidget: SvgPicture.asset('assets/svgicons/order.svg'),
                  title: "Orders",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const OrderHistoryScreen()));
                  },
                ),
                ProfileTile(
                  iconWidget: SvgPicture.asset('assets/svgicons/payment.svg'),
                  title: "Payment Method",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PaymentScreen()));
                  },
                ),
              ],
            ),
            SectionContainer(
              children: [
                ProfileTile(
                  iconWidget: SvgPicture.asset('assets/svgicons/faq.svg'),
                  title: "FAQ",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CustomerSupportsScreen()));
                  },
                ),
                ProfileTile(
                  iconWidget: SvgPicture.asset('assets/svgicons/setting.svg'),
                  title: "Settings",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SettingsScreen()));
                  },
                ),
                ProfileTile(
                  iconWidget:
                      SvgPicture.asset('assets/svgicons/terms-of-service.svg'),
                  title: "Terms of Service",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const TermsAndServiceScreen()));
                  },
                ),
              ],
            ),
            SectionContainer(
              children: [
                ProfileTile(
                  iconWidget: SvgPicture.asset('assets/svgicons/log_out.svg'),
                  title: "Log Out",
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
