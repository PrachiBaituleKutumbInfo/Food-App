import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationEditManuallyScreen extends StatefulWidget {
  const LocationEditManuallyScreen({super.key});

  @override
  State<LocationEditManuallyScreen> createState() => _LocationEditManuallyScreenState();
}

class _LocationEditManuallyScreenState extends State<LocationEditManuallyScreen> {
  late GoogleMapController mapController;
  LatLng selectedLocation = const LatLng(16.038, 73.467); // Default location

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      selectedLocation = position.target;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Google Map
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: selectedLocation,
              zoom: 14.0,
            ),
            onCameraMove: _onCameraMove,
          ),

          /// Moving Pin Indicator
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.deepOrange,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Move to edit location",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),

          /// Address Selection Card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Address Heading
                  const Text(
                    "What's your address?",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  /// Address Text
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "A-205, Nakshatra Apartment, Police Line,\nOros, Sindhudurg, Maharashtra 416534",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Edit address functionality
                        },
                        icon: const Icon(Icons.edit, color: Colors.orange),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Error Message
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.error_outline, color: Colors.orange),
                        SizedBox(width: 8),
                        Text(
                          "We are sorry! We don't serve this area yet.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// "USE THIS ADDRESS" Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Confirm address functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "USE THIS ADDRESS",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
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
