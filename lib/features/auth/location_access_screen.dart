import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/location_selection_screen1.dart';
import 'package:konkan_bite_food/features/auth/address_details_screen.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Location Image with Error Handling
                  SvgPicture.asset(
                    'assets/svgicons/location.svg',
                    height: 150,
                    placeholderBuilder: (context) => const CircularProgressIndicator(),
                  ),
                  const SizedBox(height: 30),

                  // Heading
                  const Text(
                    'Allow location access',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Benefits List
                  buildBulletPoint("Real-time tracking of your order"),
                  buildBulletPoint("Faster and more accurate delivery"),
                  buildBulletPoint("Easy communication with the delivery person"),
                  buildBulletPoint("Increase safety and security during delivery"),
                ],
              ),
            ),

            // Buttons at the Bottom
            Column(
              children: [
                buildActionButton(
                  text: "USE CURRENT LOCATION",
                  backgroundColor: Colors.deepOrange,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LocationSelectionScreen(userLocation: ''),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                buildActionButton(
                  text: "ENTER MANUALLY",
                  backgroundColor: const Color.fromARGB(255, 241, 239, 238),
                  textColor: Colors.deepOrange,
                  borderColor: Colors.deepOrange,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddressDetailsScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to create bullet points
  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  // Function to create buttons
  Widget buildActionButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: borderColor != null ? BorderSide(color: borderColor) : BorderSide.none,
          ),
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
      ),
    );
  }
}
