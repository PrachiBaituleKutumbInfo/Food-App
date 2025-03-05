import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location Image
                  SvgPicture.asset('assets/svgicons/location.svg', height: 150),
                  const SizedBox(height: 30),

                  // Heading
                  const Text(
                    'Allow location access',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Benefits List
                  const Text('• Real-time tracking of your order',
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  const Text('• Faster and more accurate delivery',
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  const Text('• Easy communication with the delivery person',
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  const Text('• Increase safety and security during delivery',
                      textAlign: TextAlign.center),
                ],
              ),
            ),

            // Buttons at the Bottom
            Column(
              children: [
                // Use Current Location Button
                 SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LocationSelectionScreen1(userLocation: '',)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "USE CURRENT LOCATION",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
                const SizedBox(height: 15),

                // Enter Manually Button
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddressDetailsScreen(),
                      ));
                      // Add navigation logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 241, 239, 238),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'ENTER MANUALLY',
                      style: TextStyle(color: Colors.deepOrange, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
