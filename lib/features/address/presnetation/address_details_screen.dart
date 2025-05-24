import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_bloc.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_event.dart';
import 'package:konkan_bite_food/features/address/presnetation/widgets/address_type_button.dart';
import 'package:konkan_bite_food/features/address/presnetation/widgets/app_radio_button.dart';
import 'package:konkan_bite_food/features/address/presnetation/widgets/address_custom_textfield.dart';
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
  String? houseError;
  String? buildingError;
  String? addressError;
  String? nameError;
  String? mobileError;

  bool _formIsValid() {
    setState(() {
      houseError =
          houseNumberController.text.trim().isEmpty ? 'Required' : null;
      buildingError =
          buildingNameController.text.trim().isEmpty ? 'Required' : null;
      addressError =
          addressLineController.text.trim().isEmpty ? 'Required' : null;
      nameError = nameController.text.trim().isEmpty ? 'Required' : null;

      final mobile = mobileController.text.trim();
      if (mobile.isEmpty) {
        mobileError = 'Required';
      } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(mobile)) {
        mobileError = 'Invalid mobile number';
      } else {
        mobileError = null;
      }
    });

    return houseError == null &&
        buildingError == null &&
        addressError == null &&
        nameError == null &&
        mobileError == null;
  }

  String selectedPerson = "Myself";
  String selectedAddressType = "Home";

  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController addressLineController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

@override
void dispose() {
  houseNumberController.dispose();
  buildingNameController.dispose();
  addressLineController.dispose();
  landmarkController.dispose();
  nameController.dispose();
  mobileController.dispose();
  super.dispose();
}

String getNormalizedAddressType(String type) {
    switch (type.toLowerCase()) {
      case 'home':
        return 'HOME';
      case 'work':
        return 'OFFICE';
      case 'other':
        return 'OTHER';
      default:
        return 'HOME';
    }
  }

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
                      children: ["Myself", "For someone else"].map((title) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: CustomRadioButton(
                            title: title,
                            isSelected: selectedPerson == title,
                            onTap: () => setState(() => selectedPerson = title),
                          ),
                        );
                      }).toList(),
                    )

                    // Row(
                    //   children: [
                    //     CustomRadioButton(
                    //       title: "Myself",
                    //       isSelected: selectedPerson == "Myself",
                    //       onTap: () {
                    //         setState(() {
                    //           selectedPerson = "Myself";
                    //         });
                    //       },
                    //     ),
                    //     const SizedBox(width: 20),
                    //     CustomRadioButton(
                    //       title: "For someone else",
                    //       isSelected: selectedPerson == "For someone else",
                    //       onTap: () {
                    //         setState(() {
                    //           selectedPerson = "For someone else";
                    //         });
                    //       },
                    //     ),
                    //   ],
                    // ),
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
                  hintText: "House Number",
                  errorText: houseError,
                ),
                CustomTextField(
                  controller: buildingNameController,
                  hintText: "Building Name",
                  errorText: buildingError,
                ),
                CustomTextField(
                  controller: addressLineController,
                  hintText: "Address Line 1",
                  errorText: addressError,
                ),
                CustomTextField(
                  controller: landmarkController,
                  hintText: "Near Landmark (optional)",
                  // errorText: landmarkError,
                ),
                CustomTextField(
                  controller: nameController,
                  hintText: "Your Name",
                  errorText: nameError,
                ),
                CustomTextField(
                  controller: mobileController,
                  hintText: "Mobile Number",
                  errorText: mobileError,
                ),

                const SizedBox(height: 20),
                CustomActionButton.orangeFilled(
                    text: "SAVE ADDRESS",
                    isEnable: true,
                    onPressed: () {
                      if (_formIsValid()) {
                        final address = AddressModel(
                          houseNumber: houseNumberController.text,
                          buildingName: buildingNameController.text,
                          addressLineOne: addressLineController.text,
                          nearbyLandmark: landmarkController.text,
                          city: 'Mumbai',
                          state: 'Maharashtra',
                          zipCode: '400001',
                          country: 'India',
                          urName: nameController.text,
                          mobNum: mobileController.text,
                          addressType:
                              getNormalizedAddressType(selectedAddressType),
                          isPrimary: true,
                          primarymob: mobileController.text,
                          emailAdd: 'test@example.com',
                        );

                        context
                            .read<AddressBloc>()
                            .add(AddAddressEvent(address));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Address saved successfully")),
                        );

                        print(
                            "✅ Saved Address: ${address.toJson()}"); // Ensure you have toJson()
                        Navigator.pop(context); // optional: close bottom sheet
                      }
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
