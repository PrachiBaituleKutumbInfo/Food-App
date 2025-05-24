// import 'package:flutter/material.dart';
// import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: AppColors.lightBlueGrey,
//           hintText: hintText,
//           hintStyle: const TextStyle(
//             color: AppColors.steelBlue,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: AppColors.softBlue),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: AppColors.softBlue),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: AppColors.softBlue, width: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText; // ✅ Add this line

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText, // ✅ Add this line
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightBlueGrey,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.steelBlue),
          errorText: errorText, // ✅ Use it here
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.softBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.softBlue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.softBlue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
}
