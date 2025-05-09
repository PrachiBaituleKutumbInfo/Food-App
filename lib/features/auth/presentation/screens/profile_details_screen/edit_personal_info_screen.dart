import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_awatar_widget.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_card_widget.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12,),
          child: CircularBackButton(onPressed: () => Navigator.pop(context),)
          
        ),
        title: const Text(
          'Personal Info',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle edit
            },
            child: const Text(
              'Edit',
              style: TextStyle(
                color: Colors.deepOrange,
                decoration: TextDecoration.underline,
                decorationColor: Colors.deepOrange,
                decorationThickness: 2,

              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // User Info
           const ProfileInfoRow(
              name: 'Deven Parab',
              email: 'devenparab@gmail.com',
              phone: '+91 9876543210',
              avatarAssetPath: 'assets/svgicons/profile-icon.svg',
            ),
            const SizedBox(height: 30),

            // Info Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
          color: AppColors.lightBlueGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  ProfileCardWidget(
                    icon: SvgPicture.asset('assets/svgicons/person.svg'),
                    label: "Full Name",
                    value: "Deven Parab",
                  ),
                  const SizedBox(height: 16),
                 ProfileCardWidget(
                    icon: SvgPicture.asset('assets/svgicons/mail.svg'),
                    label: "Email",
                    value: "devenparab@gmail.com",
                  ),
                  const SizedBox(height: 16),
                 ProfileCardWidget(
                    icon: SvgPicture.asset('assets/svgicons/phone.svg'),
                    label: "Phone Number",
                    value: "+91 9876543210",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
