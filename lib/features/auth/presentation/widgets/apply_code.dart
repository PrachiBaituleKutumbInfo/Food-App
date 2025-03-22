import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplyCodeWidget extends StatelessWidget {
  const ApplyCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Title: Discount & Promo Codes**
          Row(
            children: [
              SvgPicture.asset(
                'assets/svgicons/tag.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8), // Space between icon and text
              const Text(
                'Discount & Promo Codes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 15),

          /// **TextField with Right-side Apply Button**
          SizedBox(
            height: 50, // Ensure TextField & Button are equal in height
            child: TextField(
              textAlignVertical: TextAlignVertical.center, // Align text properly
              decoration: InputDecoration(
                hintText: "Type Coupon Code",
                hintStyle: const TextStyle(color: Colors.grey), // Hint text color
                filled: true,
                fillColor: Colors.blueGrey.shade50, // Light background color

                // Border styling
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 2),
                ),

                // Right-side APPLY button inside TextField
                suffixIcon: Container(
                  height: 50, // Match height with TextField
                  margin: const EdgeInsets.only(right: 5), // Adjust spacing
                  child: ElevatedButton(
                    onPressed: () {
                      print("Apply Code Pressed!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15), // Adjust button padding
                    ),
                    child: const Text(
                      'APPLY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, // Adjust font size for better fit
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
