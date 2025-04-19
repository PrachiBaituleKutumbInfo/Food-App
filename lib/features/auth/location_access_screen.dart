import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/location_selection_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/location_edit_manually_screen.dart';

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
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: _buildSvgImage(),
                  ),
                  const SizedBox(height: 30),

                  // Heading & Bullet Points
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Allow location access',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      buildBulletPoint("Real-time tracking of your order"),
                      buildBulletPoint("Faster and more accurate delivery"),
                      buildBulletPoint("Easy communication with the delivery person"),
                      buildBulletPoint("Increase safety and security during delivery"),
                    ],
                  ),
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
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationEditManuallyScreen(),
                        ),
                      );
                    });
                  },
                ),
                const SizedBox(height: 15),
                buildActionButton(
                  text: "ENTER MANUALLY",
                  backgroundColor: const Color.fromARGB(255, 241, 239, 238),
                  textColor: Colors.deepOrange,
                  borderColor: Colors.deepOrange,
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LocationSelectionScreen(),
                          // AddressDetailsScreen(),
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to display SVG with error handling
  Widget _buildSvgImage() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/svgicons/location.svg'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return SvgPicture.asset(
            'assets/svgicons/location.svg',
            height: 150,
            width: 150,
            fit: BoxFit.contain,
          );
        } else if (snapshot.hasError) {
          return const Icon(Icons.error, color: Colors.red, size: 50);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  // Function to create bullet points
  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("• ", style: TextStyle(fontSize: 20)),
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
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
        ),
        child: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
      ),
    );
  }
}
