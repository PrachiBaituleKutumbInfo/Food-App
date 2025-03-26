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
              textAlignVertical:
                  TextAlignVertical.center, // Align text properly
              decoration: InputDecoration(
                hintText: "Type Coupon Code",
                hintStyle:
                    const TextStyle(color: Colors.grey), // Hint text color
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
                  margin: const EdgeInsets.only(right: 0), // Adjust spacing
                  child: ElevatedButton(
                    onPressed: () {
                      print("Apply Code Pressed!");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15), // Adjust button padding
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        'APPLY',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Adjust font size for better fit
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),

          Row(
            children: [
              SvgPicture.asset(
                'assets/svgicons/Bill.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8), // Space between icon and text
              const Text(
                'Bill Discounts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
           /// **Bill Summary**
          Column(
            children: [
              billRow("Subtotal", "₹210"),
              billRow("Discount", "-₹50", isNegative: true),
              billRow("Delivery Fee", "₹25"),
              billRow("Tax & Other Fees", "₹10"),
              billRow("Platform Fees", "₹5"),
              const SizedBox(height: 10),
              // const Divider(thickness: 1),
              billRow("To Pay", "₹420", isBold: true),
            ],
          ),
        ],
      ),
    );
  }

  /// **Reusable Method for Bill Row Items**
  Widget billRow(String title, String value, {bool isNegative = false, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isNegative ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
      