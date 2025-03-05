import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class LocationSelectionScreen1 extends StatefulWidget {
  final String userLocation;

  const LocationSelectionScreen1({super.key, required this.userLocation});

  @override
  State<LocationSelectionScreen1> createState() => _LocationSelectionScreen1State();
}

class _LocationSelectionScreen1State extends State<LocationSelectionScreen1> {
  late GoogleMapController _mapController;
  LatLng _currentPosition = const LatLng(19.0760, 72.8777); // Default to Mumbai
  String _address = "Fetching location...";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _address = "Location services are disabled.";
      });
      return;
    }

    // Request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _address = "Location permissions denied";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _address = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _address = "Current Location Selected"; // Update UI
    });

    // Move map to current position
    _mapController.animateCamera(CameraUpdate.newLatLng(_currentPosition));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _onMarkerDragged(LatLng newPosition) {
    setState(() {
      _currentPosition = newPosition;
      _address = "Updated Location Selected"; // Show updated text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(target: _currentPosition, zoom: 15),
            markers: {
              Marker(
                markerId: const MarkerId("selected_location"),
                position: _currentPosition,
                draggable: true,
                onDragEnd: _onMarkerDragged,
              ),
            },
          ),

          // Search & Address UI
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What's your address?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: TextField(
                      
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 211, 210, 210),
                        hintText: "Search for a building, street name or area",hintStyle: TextStyle(color: Colors.grey),
                        suffix: Icon(Icons.search),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

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
                  "USE THIS ADDRESS",
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
