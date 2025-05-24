import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class ItemAddedBottomBar {

  
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      barrierColor: Colors.transparent,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth; // Get screen width
            double padding =
                width > 600 ? 50.0 : 20.0; // Adjust padding for tablets

            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: padding),
              decoration: BoxDecoration(
                color: Colors.white,
               
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Section (Text Info)
                  const Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1 item added",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4), // Small spacing
                        Text(
                          "Add items worth Rs. 299 more to get free delivery",
                          style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 92, 91, 91)),
                        ),
                      ],
                    ),
                  ),
              
                  // Right Section (Button)
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pop(context); // Close bottom sheet
                        Navigator.pushNamed(context, "/cart");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mintGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: width > 600 ? 24 : 16,
                            vertical: width > 600 ? 12 : 10),
                      ),
                      child: const Text(
                        "VIEW CART",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
