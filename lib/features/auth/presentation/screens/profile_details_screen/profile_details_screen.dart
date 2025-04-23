import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/address_detail_screen/address_details_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/customer_supports_screen/customer_supports_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/payment_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/edit_personal_info_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_history_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_tile.dart';

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
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 244, 243, 243),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
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
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: SvgPicture.asset(
                    'assets/svgicons/profile-icon.svg',
                    width: 90,
                    height: 90,
                  ),
                ),
                const SizedBox(width: 15),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deven Parab',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('devenparab@gmail.com'),
                    Text(
                      '+91 9876543210',
                    ),
                  ],
                ),
              ],
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
                ),
                ProfileTile(
                  iconWidget:
                      SvgPicture.asset('assets/svgicons/terms-of-service.svg'),
                  title: "Terms of Service",
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
