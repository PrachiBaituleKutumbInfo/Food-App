import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedbackBottomSheet extends StatelessWidget {
  const FeedbackBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Wrap(
                children: [
                  const SizedBox(height: 40), // To prevent overlap with close button
                  Center(
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/svgicons/feedbackimage.svg'),
                        const SizedBox(height: 20),
                        const Text(
                          'How was Konkan Bite Food and Delivery?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Help us improve our services and your experiences by rating this delivery.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 59, 71, 80),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 30),
                            Icon(Icons.star, color: Colors.orange, size: 30),
                            Icon(Icons.star, color: Colors.orange, size: 30),
                            Icon(Icons.star, color: Colors.orange, size: 30),
                            Icon(Icons.star_border, color: Colors.orange, size: 30),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: "Write your feedback here",
                            hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 167, 179, 183),
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 230, 236, 239),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -55,
              right: 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
