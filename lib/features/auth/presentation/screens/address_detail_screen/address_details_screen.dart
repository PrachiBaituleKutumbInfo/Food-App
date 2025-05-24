import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/address_detail_screen/address_card_widget.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

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
          'My Address',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Location
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint('Location icon tapped!');
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.lightBlueGrey,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/svgicons/location_pin.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current Location',
                          style: AppTextStyle.title1Medium),
                      Text('Using GPS'),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 30),
              CustomActionButton.orangeFilled(
                text: "ADD NEW ADDRESS",
                isEnable: true,
                onPressed: () {
                  // Navigator.pushNamed(context, Routes.locationAccessRoute);
                  print('ADD NEW ADDRESS');
                },
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              const Text('Saved Locations', style: AppTextStyle.title1Medium),

              const SizedBox(height: 20),

              AddressCard(
                iconWidget: SvgPicture.asset(
                  'assets/svgicons/home-green.svg',
                  width: 30,
                  height: 30,
                ),
                label: 'Home',
                address:
                    "A-205, Nakshatra Apartment, Police Line,\nOros, Sindhudurg, Maharashtra 416534",
                onEdit: () {
                  debugPrint("Edit Home tapped");
                },
                onDelete: () {
                  debugPrint("Delete Home tapped");
                },
              ),

              const SizedBox(height: 10),

              AddressCard(
                iconWidget: SvgPicture.asset(
                  'assets/svgicons/work-blue.svg',
                  width: 30,
                  height: 30,
                ),
                label: 'Work',
                address:
                    "A-205, Nakshatra Apartment, Police Line,\nOros, Sindhudurg, Maharashtra 416534",
                onEdit: () {
                  debugPrint("Edit Work tapped");
                },
                onDelete: () {
                  debugPrint("Delete Work tapped");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
