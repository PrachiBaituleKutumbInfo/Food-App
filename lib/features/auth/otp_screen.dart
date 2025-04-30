import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/location_access_screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isEnable = true;
  List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> otpFocusNodes = List.generate(4, (index) => FocusNode());

  int countdown = 50;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer?.cancel(); // Cancel existing timer before starting a new one
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    timer?.cancel();
    super.dispose();
  }

  void verifyOtp() {
    bool isOtpComplete =
        otpControllers.every((controller) => controller.text.trim().isNotEmpty);

    if (isOtpComplete) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LocationAccessScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter the complete OTP"),
          backgroundColor: Color.fromARGB(255, 236, 170, 166),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text("Verify Details",
                      style: AppTextStyle.title1Medium
                          .copyWith(color: AppColors.deepNavy)),
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                "Please enter the OTP we have just sent to",
                style: TextStyle(fontSize: 17, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                "+91 9876543210",
                style:
                    AppTextStyle.caption1.copyWith(color: AppColors.deepNavy),
              ),
            ),
            const SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Enter OTP',
                style:
                    AppTextStyle.caption2.copyWith(color: AppColors.oliveGreen),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: TextField(
                      controller: otpControllers[index],
                      focusNode: otpFocusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      inputFormatters: [
                        FilteringTextInputFormatter
                            .digitsOnly, // Allows only numbers
                      ],
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: AppColors.lightBlueGrey,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.softBlue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.softBlue),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 3) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }

                        // Auto-submit OTP when all fields are filled
                        if (otpControllers.every(
                            (controller) => controller.text.isNotEmpty)) {
                          verifyOtp();
                        }
                      },
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            CustomActionButton.orangeFilled(
              text: "VERIFY",
              isEnable: isEnable,
              onPressed: () {
                Navigator.pushNamed(context, Routes.locationAccessRoute);
                print('verify');
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive OTP?",
                    style: AppTextStyle.caption2
                        .copyWith(color: AppColors.oliveGreen),
                  ),
                  const SizedBox(width: 5),
                  countdown > 0
                      ? Row(
                          children: [
                            const Text(
                              "Resend",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.0,
                                color: AppColors.deepNavy,
                                height:
                                    2, // This increases the line height (space between text and underline)
                              ),
                            ),
                            Text(
                              " in $countdown sec",
                              style: AppTextStyle.caption2
                                  .copyWith(color: AppColors.oliveGreen),
                            ),
                          ],
                        )
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              countdown = 50;
                              startCountdown();
                            });
                          },
                          child: const Text(
                            "Resend",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationThickness: 2.0,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
