import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/presentation/address_detail_sheet/address_details_screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/Info_warning_widget.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class LocationEditManuallyScreen extends StatefulWidget {
  const LocationEditManuallyScreen({super.key});

  @override
  State<LocationEditManuallyScreen> createState() =>
      _LocationEditManuallyScreenState();
}

class _LocationEditManuallyScreenState
    extends State<LocationEditManuallyScreen> {
  bool isEnable = true;

  void showAddressDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent, // Makes the background fully transparent
      // barrierColor: Colors.black.withOpacity(0.3), // Semi-transparent black background behind sheet
      builder: (context) => const AddressDetailsBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🗺️ Full-screen Map Image
          Positioned.fill(
            child: Image.asset(
              'assets/map.png',
              fit: BoxFit.cover,
            ),
          ),

          // 📍 Center Pin with Label
          Positioned.fill(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.deepOrange,
                ),
                Positioned(
                  top: 40,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      "Move to edit location",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 📦 Bottom Address Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What's your address?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "A-205, Nakshatra Apartment, Police Line,\nOros, Sindhudurg, Maharashtra 416534",
                              style: AppTextStyle.caption2
                                  .copyWith(color: AppColors.oliveGreen),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showAddressDetailsBottomSheet(context);
                            },
                            icon: SvgPicture.asset('assets/svgicons/edit.svg',
                                width: 24,
                                height: 24,
                                color: AppColors.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const AppInfoBox(
                        message: "We are sorry! We don't serve this area yet.",
                        icon: Icons.error_outline,
                      ),
                      const SizedBox(height: 16),
                      CustomActionButton.orangeFilled(
                        text: "USE CURRENT LOCATION",
                        isEnable: isEnable,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.dashboardhomeRoute);
                          print('USE CURRENT LOCATION');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
