import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map Placeholder (Image)
          SizedBox.expand(
            child: Image.asset(
              'assets/map.png', // <-- Add your image in assets
              fit: BoxFit.cover,
            ),
          ),

          // Back Button (Top Left)
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Order is Preparing",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Arriving at ", style: TextStyle(fontSize: 14)),
                      Text("4:35 PM", style: TextStyle(fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text("OTP - ", style: TextStyle(fontSize: 14)),
                      Text("7548", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Progress Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusIcon(label: "Accepted", isActive: true),
                      _buildDivider(),
                      _buildStatusIcon(label: "Cooking", isActive: true),
                      _buildDivider(),
                      _buildStatusIcon(label: "On the Way", isActive: false),
                      _buildDivider(),
                      _buildStatusIcon(label: "Delivered", isActive: false),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Call Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add call function
                      },
                      icon: const Icon(Icons.call),
                      label: const Text("CALL"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepOrange,
                        side: const BorderSide(color: Colors.deepOrange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size.fromHeight(45),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Cancel Link
                  const Text(
                    "Want to Cancel order?",
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
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

  Widget _buildStatusIcon({required String label, required bool isActive}) {
    return Column(
      children: [
        Icon(
          isActive ? Icons.radio_button_checked : Icons.radio_button_unchecked,
          color: isActive ? Colors.deepOrange : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const Expanded(
      child: Divider(
        color: Colors.deepOrange,
        thickness: 2,
      ),
    );
  }
}
