import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                        color: Color.fromARGB(255, 244, 243, 243),
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
                      Text(
                        'Current Location',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 159, 47, 13),
                        ),
                      ),
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
              // CustomActionButton(
              //   isEnable: true,
              //   text: 'ADD NEW ADDRESS',
              //   backgroundColor: Colors.deepOrange,
              //   textColor: Colors.white,
              //   onPressed: () {
              //     // Navigator.pushNamed(context, Routes.otpRoute);
              //     print('ADD NEW ADDRESS');
              //   },
              // ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              const Text(
                'Saved Locations',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 159, 47, 13),
                ),
              ),

              const SizedBox(height: 20),

              // Address Card - Home
              _addressCard(
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

              // Address Card - Work
              _addressCard(
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

  Widget _addressCard({
    required Widget iconWidget,
    required String label,
    required String address,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 229, 241, 248),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: onEdit,
                      icon: SvgPicture.asset(
                        'assets/svgicons/edit.svg',
                        width: 20,
                        height: 20,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: onDelete,
                      icon: SvgPicture.asset(
                        'assets/svgicons/trash-orange.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                Text(
                  address,
                  style: const TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 119, 127, 137)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
