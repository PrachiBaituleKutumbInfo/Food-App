import 'package:flutter/material.dart';

class TermsAndServiceScreen extends StatelessWidget {
  const TermsAndServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "Terms of Service",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 164, 104, 13),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
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
                  ],
                ),
              ),
            ),

            /// Divider
            Container(
              height: 1.5,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
                    blurRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Terms Sections
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSection(
                      "I. Acceptance of terms",
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry..."
                    ),
                    buildSection(
                      "II. Definitions",
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry..."
                    ),
                    buildSection(
                      "III. Payment Information",
                      "Please enter your payment information to proceed with the purchase."
                    ),
                    buildSection(
                      "IV. Shipping Address",
                      "Please provide your shipping address for delivery."
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section builder function
  Widget buildSection(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
