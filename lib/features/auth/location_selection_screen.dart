import 'package:flutter/material.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/address/presnetation/location_edit_manually_screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

// ignore: must_be_immutable
class LocationSelectionScreen extends StatelessWidget {
  LocationSelectionScreen({super.key});

  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Replace Google Map with a static image
          SizedBox.expand(
            child: Image.asset(
              'assets/map.png', // Replace with your map image path
              fit: BoxFit.cover,
            ),
          ),

          /// Bottom Address Selection UI
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                    "What's your address?",
                    style: AppTextStyle.title1Medium
                          .copyWith(color: AppColors.deepNavy),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: TextField(
                      readOnly: true, // Prevents keyboard from opening
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LocationEditManuallyScreen(),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        fillColor: AppColors.lightBlueGrey,
                        filled: true,
                        hintText: "Search for a building, street name or area",
                        hintStyle: const TextStyle(
                          color: AppColors.softBlue,
                        ),
                        suffixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.softBlue,),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color:AppColors.softBlue,),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.softBlue,),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: AppColors.softBlue,),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomActionButton.orangeFilled(
                  text: "USE CURRENT LOCATION",
                  isEnable: isEnable,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Routes.locationEditManuallyRoute);
                    print('USE CURRENT LOCATION');
                  },
                ),
                  
                 
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
