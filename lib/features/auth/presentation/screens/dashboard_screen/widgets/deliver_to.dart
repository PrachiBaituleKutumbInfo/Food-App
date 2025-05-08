import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/address_detail_screen/address_details_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_details_screen.dart';

class DeliveryAddressSection extends StatelessWidget {
  const DeliveryAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DELIVER TO',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddressDetailsScreen(),
                  ),
                );
              },
              child: const Row(
                children: [
                  Text(
                    'Home',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(width: 5),
                  Text('- A-205, Nakshatra Apart...',
                      style: TextStyle(fontSize: 14)),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfileDetailScreen()),
            );
          },
          child: SvgPicture.asset('assets/svgicons/profile-icon.svg'),
        ),
      ],
    );
  }
}
