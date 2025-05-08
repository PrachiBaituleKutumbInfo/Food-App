import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/presentation/address_detail_sheet/address_type_button.dart';
import 'package:konkan_bite_food/features/auth/presentation/address_detail_sheet/app_radio_button.dart';
import 'package:konkan_bite_food/features/auth/presentation/address_detail_sheet/app_textfield.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/Info_warning_widget.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class AddressDetailsBottomSheet extends StatefulWidget {
  const AddressDetailsBottomSheet({super.key});

  @override
  State<AddressDetailsBottomSheet> createState() =>
      _AddressDetailsBottomSheetState();
}

class _AddressDetailsBottomSheetState extends State<AddressDetailsBottomSheet> {
  String selectedPerson = "Myself";
  String selectedAddressType = "Home";

  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController addressLineController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (_, controller) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [BoxShadow(color: Colors.transparent, blurRadius: 10)],
          ),
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Add more address details",
                        style: AppTextStyle.caption1),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Who are you ordering for?"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Row(
                      children: [
                        CustomRadioButton(
                          title: "Myself",
                          isSelected: selectedPerson == "Myself",
                          onTap: () {
                            setState(() {
                              selectedPerson = "Myself";
                            });
                          },
                        ),
                        const SizedBox(width: 20),
                        CustomRadioButton(
                          title: "For someone else",
                          isSelected: selectedPerson == "For someone else",
                          onTap: () {
                            setState(() {
                              selectedPerson = "For someone else";
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const AppInfoBox(
                  message:
                      "A detailed address will help our delivery person reach your address easily",
                ),

                
                const SizedBox(height: 10),
                const Text("Save address as"),
                Row(
                  children: [
                    AddressTypeButton(
                      type: "Home",
                      assetPath: "assets/svgicons/home.svg",
                      isSelected: selectedAddressType == "Home",
                      onTap: () {
                        setState(() {
                          selectedAddressType = "Home";
                        });
                      },
                    ),
                    AddressTypeButton(
                      type: "Work",
                      assetPath: "assets/svgicons/briefcase.svg",
                      isSelected: selectedAddressType == "Work",
                      onTap: () {
                        setState(() {
                          selectedAddressType = "Work";
                        });
                      },
                    ),
                    AddressTypeButton(
                      type: "Other",
                      assetPath: "assets/svgicons/location-pin.svg",
                      isSelected: selectedAddressType == "Other",
                      onTap: () {
                        setState(() {
                          selectedAddressType = "Other";
                        });
                      },
                    ),
                  ],
                ),
                CustomTextField(
                    controller: houseNumberController,
                    hintText: "House Number"),
                CustomTextField(
                    controller: buildingNameController,
                    hintText: "Building Name"),
                CustomTextField(
                    controller: addressLineController,
                    hintText: "Address Line 1"),
                CustomTextField(
                    controller: landmarkController,
                    hintText: "Nearby Landmark (optional)"),
                CustomTextField(
                    controller: nameController, hintText: "Your Name"),
                CustomTextField(
                    controller: mobileController, hintText: "Mobile Number"),

                const SizedBox(height: 20),
                CustomActionButton.orangeFilled(
                  text: "SAVE ADDRESS",
                  isEnable: true,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.locationAccessRoute);
                    print('Save');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
