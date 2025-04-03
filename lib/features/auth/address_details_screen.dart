import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/location_edit_manually_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/home_screen.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  String selectedPerson = "Myself";
  String selectedAddressType = "Home";

  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();
  final TextEditingController addressLineController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  void _saveAddress() {
    // Handle saving address logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/map.png',
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Add more address details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
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
                        _buildRadioButton("Myself"),
                      const  SizedBox(width: 20),
                        _buildRadioButton("For someone else"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 254, 225, 183),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 246, 179, 131),
                            width: 2),
                      ),
                      child: const Text(
                        "A detailed address will help our delivery person reach your address easily",
                        style:
                            TextStyle(color: Color.fromARGB(255, 171, 107, 56)),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("Save address as"),
                    Row(
                      children: [
                        _buildAddressTypeButton(
                            "Home", "assets/svgicons/home.svg",
                            isSvg: true),
                        _buildAddressTypeButton(
                            "Work", "assets/svgicons/briefcase.svg",
                            isSvg: true),
                        _buildAddressTypeButton(
                            "Other", "assets/svgicons/location-pin.svg",
                            isSvg: true),
                      ],
                    ),
                    // const SizedBox(height: 10),
                    _buildTextField(houseNumberController, "House Number"),
                    _buildTextField(buildingNameController, "Building Name"),
                    _buildTextField(addressLineController, "Address Line 1"),
                    _buildTextField(
                        landmarkController, "Nearby Landmark (optional)"),
                    _buildTextField(nameController, "Your Name"),
                    _buildTextField(mobileController, "Mobile Number"),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          _saveAddress(); // Call your save function
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomeScreen(), // Replace with your next screen
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("SAVE ADDRESS",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String title) {
    bool isSelected = selectedPerson == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPerson = title;
        });
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.deepOrange,
                width: isSelected
                    ? 6.5
                    : 2, // ✅ Selected -> Bold Border, Unselected -> Normal Border
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressTypeButton(String type, String assetPath,
      {bool isSvg = false}) {
    bool isSelected = selectedAddressType == type;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            selectedAddressType = type;
          });
        },
        icon: isSvg
            ? SvgPicture.asset(
                assetPath,
                width: 24,
                height: 24,
                color: isSelected
                    ? Colors.deepOrange
                    : Colors.black, // ✅ Color applied here
              )
            : Icon(
                Icons.location_on,
                color: isSelected ? Colors.deepOrange : Colors.grey,
              ),
        label: Text(
          type,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.deepOrange : Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? const Color.fromARGB(255, 254, 232, 232)
              : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: isSelected
                  ? Colors.deepOrange
                  : const Color.fromARGB(255, 198, 211, 213),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true, // Enable background fill
          fillColor: const Color.fromARGB(255, 234, 242, 242), // Light grey background
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 142, 149, 149),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey), // Grey border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey), // Grey border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.grey, width: 2), // Darker grey on focus
          ),
        ),
      ),
    );
  }
}
