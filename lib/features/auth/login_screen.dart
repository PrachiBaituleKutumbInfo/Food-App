// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:http/http.dart' as http;
// import 'package:konkan_bite_food/core/config/routes.dart';
// import 'package:konkan_bite_food/features/auth/presentation/screens/terms_of_service/terms_and_service_screen.dart';
// import 'package:konkan_bite_food/features/auth/privacy_policy_screen.dart';
// import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
// import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
// import 'package:konkan_bite_food/widgets/custom_button.dart';
// import 'package:konkan_bite_food/widgets/custom_login_textfield.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController countryCodeController = TextEditingController();
//   bool isEnable = false;

//   void login(String phoneNumber) async {
//     try {
//       final uri = Uri.parse('http://localhost:8087/auth/send-otp')
//           .replace(queryParameters: {'mobileNumber': phoneNumber});

//       final response = await http.post(uri);

//       if (response.statusCode == 200) {
//         print('OTP Sent Successfully');
//       } else {
//         print('Failed to send OTP. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: ${e.toString()}');
//     }
//   }

//   @override
//   void initState() {
//     countryCodeController.text = '+91';
//     super.initState();
//   }

//   void _validatePhone(String value) {
//     setState(() {
//       isEnable = value.length == 10;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: Image.asset(
//               'assets/images/image-biryani.png',
//               fit: BoxFit.contain,
//               width: double.infinity,
//             ),
//           ),
//           Positioned(
//             top: screenHeight * 0.35,
//             left: 0,
//             right: 0,
//             child: Container(
//               height: screenHeight * 0.68,
//               padding: const EdgeInsets.all(20),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Konkan #1 Food Delivery App",
//                     style: AppTextStyle.loginTitleMedium
//                         .copyWith(color: AppColors.deepNavy),
//                   ),
//                   const SizedBox(height: 20),
//                   Text("Login or Signup",
//                       style: AppTextStyle.title1Medium
//                           .copyWith(color: AppColors.deepNavy)),
//                   const SizedBox(height: 15),
//                   Text("Enter Mobile Number",
//                       style: AppTextStyle.caption2
//                           .copyWith(color: AppColors.oliveGreen)),
//                   const SizedBox(height: 8),
//                   CustomPhoneTextField(
//                     countryCodeController: countryCodeController,
//                     phoneNumberController: phoneNumberController,
//                     onChanged: _validatePhone,
//                     isEnable: isEnable,
//                   ),
//                   const SizedBox(height: 20),
//                   CustomActionButton.orangeFilled(
//                     text: "CONTINUE",
//                     isEnable: isEnable,
//                     onPressed: () {
//                       Navigator.pushNamed(context, Routes.otpRoute);
//                       print('hit continue');
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: Text('or connect with',
//                         style: AppTextStyle.caption2
//                             .copyWith(color: AppColors.oliveGreen)),
//                   ),
//                   const SizedBox(height: 20),
//                   CustomActionButton.orangeBorderWithIcon(
//                     text: "GOOGLE",
//                     icon: SvgPicture.asset(
//                       'assets/svgicons/google.svg',
//                     ),
//                     onPressed: () {
//                       print("Google button pressed");
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: Text.rich(
//                       TextSpan(
//                         text: "By continuing you agree to the ",
//                         style: const TextStyle(color: AppColors.oliveGreen),
//                         children: [
//                           TextSpan(
//                             text: "Terms of Service",
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.underline,
//                                 decorationThickness: 2.0,
//                                 color: AppColors.deepNavy),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const TermsAndServiceScreen()),
//                                 );
//                               },
//                           ),
//                         const  TextSpan(
//                             text: " and ",
//                             style: TextStyle(color: AppColors.oliveGreen),
//                           ),
//                           TextSpan(
//                             text: "Privacy Policy",
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.underline,
//                                 decorationThickness: 2.0,
//                                 height: 2,
//                                 color: AppColors.deepNavy),
//                             recognizer: TapGestureRecognizer()
//                               ..onTap = () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const PrivacyPolicyScreen()),
//                                 );
//                               },
//                           ),
//                         ],
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
