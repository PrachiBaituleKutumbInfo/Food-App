import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

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
                  const SizedBox(
                      height: 40), // To prevent overlap with close button
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
                            color: AppColors.darkText,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: AppColors.amber, size: 30),
                            Icon(Icons.star, color: AppColors.amber, size: 30),
                            Icon(Icons.star, color: AppColors.amber, size: 30),
                            Icon(Icons.star, color: AppColors.amber, size: 30),
                            Icon(Icons.star_border,
                                color: AppColors.amber, size: 30),
                          ],
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          minLines: 3,
                          maxLines: 10,
                          decoration: InputDecoration(
                            hintText: "Write your feedback here",
                            hintStyle: const TextStyle(
                              color: AppColors.steelBlue,
                            ),
                            filled: true,
                            fillColor: AppColors.lightBlueGrey,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: AppColors.softBlue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: AppColors.softBlue),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomActionButton.orangeFilled(
                          text: "SUBMIT",
                          isEnable: true,
                          onPressed: () {
                            // Navigator.pushNamed(context, Routes.locationAccessRoute);
                            print('submit');
                          },
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
