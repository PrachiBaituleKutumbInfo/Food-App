import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/feature1/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   final String? mobileNumber;
//   const OtpVerificationScreen({super.key, this.mobileNumber});

//   @override
//   OtpVerificationScreenState createState() => OtpVerificationScreenState();
// }

// class OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final List<TextEditingController> otpControllers =
//       List.generate(4, (index) => TextEditingController());
//   final List<FocusNode> otpFocusNodes =
//       List.generate(4, (index) => FocusNode());
//   final _formKey = GlobalKey<FormState>();
//   int countdown = 50;
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     startCountdown();
//   }

//   void startCountdown() {
//     timer?.cancel();
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (countdown > 0) {
//         setState(() {
//           countdown--;
//         });
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     for (var controller in otpControllers) {
//       controller.dispose();
//     }
//     for (var node in otpFocusNodes) {
//       node.dispose();
//     }
//     timer?.cancel();
//     super.dispose();
//   }

//   String _getOtp() {
//     return otpControllers.map((controller) => controller.text).join();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mobileNumber = widget.mobileNumber ?? 'Unknown';
//     bool isEnable =
//         otpControllers.every((controller) => controller.text.isNotEmpty);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthOtpVerificationSuccessState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('OTP verified successfully')),
//             );
//             Navigator.pushReplacementNamed(context, Routes.locationAccessRoute);
//           } else if (state is AuthOtpReceivedFailureState ||
//               state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                     'Error: ${state is AuthOtpReceivedFailureState ? state.errorMessage : (state as AuthFailure).errorMessage}'),
//                 backgroundColor: const Color.fromARGB(255, 236, 170, 166),
//               ),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back,
//                           color: AppColors.deepNavy),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         "Verify Details",
//                         style: AppTextStyle.title1Medium
//                             .copyWith(color: AppColors.deepNavy),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 60),
//                 const Center(
//                   child: Text(
//                     "Please enter the OTP we have just sent to",
//                     style: TextStyle(fontSize: 17, color: Colors.black54),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Center(
//                   child: Text(
//                     "+91 $mobileNumber",
//                     style: AppTextStyle.caption1
//                         .copyWith(color: AppColors.deepNavy),
//                   ),
//                 ),
//                 const SizedBox(height: 70),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     'Enter OTP',
//                     style: AppTextStyle.caption2
//                         .copyWith(color: AppColors.oliveGreen),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(4, (index) {
//                     return Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: TextFormField(
//                           controller: otpControllers[index],
//                           focusNode: otpFocusNodes[index],
//                           keyboardType: TextInputType.number,
//                           textAlign: TextAlign.center,
//                           maxLength: 1,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly,
//                           ],
//                           decoration: InputDecoration(
//                             counterText: "",
//                             filled: true,
//                             fillColor: AppColors.lightBlueGrey,
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide:
//                                   const BorderSide(color: AppColors.softBlue),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide:
//                                   const BorderSide(color: AppColors.softBlue),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(color: Colors.red),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(color: Colors.red),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return '';
//                             }
//                             if (!RegExp(r'^\d$').hasMatch(value)) {
//                               return '';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             if (value.isNotEmpty && index < 3) {
//                               FocusScope.of(context).nextFocus();
//                             } else if (value.isEmpty && index > 0) {
//                               FocusScope.of(context).previousFocus();
//                             }
//                             setState(() {}); // Update isEnable
//                           },
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 30),
//                 BlocBuilder<AuthBloc, AuthState>(
//                   builder: (context, state) {
//                     return CustomActionButton.orangeFilled(
//                       text: "VERIFY",
//                       isEnable: isEnable,
//                       onPressed: () {
//                         if (isEnable && state is! AuthLoading) {
//                           if (_formKey.currentState!.validate()) {
//                             context.read<AuthBloc>().add(
//                                   VerifyOtpEvent(_getOtp()),
//                                 );
//                           }
//                         }
//                       },
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Didn't receive OTP?",
//                         style: AppTextStyle.caption2
//                             .copyWith(color: AppColors.oliveGreen),
//                       ),
//                       const SizedBox(width: 5),
//                       countdown > 0
//                           ? Row(
//                               children: [
//                                 Text(
//                                   "Resend",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     decoration: TextDecoration.underline,
//                                     decorationThickness: 2.0,
//                                     color: AppColors.deepNavy,
//                                     height: 2,
//                                   ),
//                                 ),
//                                 Text(
//                                   " in $countdown sec",
//                                   style: AppTextStyle.caption2
//                                       .copyWith(color: AppColors.oliveGreen),
//                                 ),
//                               ],
//                             )
//                           : GestureDetector(
//                               onTap: () {
//                                 context.read<AuthBloc>().add(
//                                       LoginWithOtpEvent(mobileNumber),
//                                     );
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('OTP resent')),
//                                 );
//                                 setState(() {
//                                   countdown = 50;
//                                   startCountdown();
//                                 });
//                               },
//                               child: const Text(
//                                 "Resend",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: TextDecoration.underline,
//                                   decorationThickness: 2.0,
//                                   color: AppColors.deepNavy,
//                                   height: 2,
//                                 ),
//                               ),
//                             ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//remove below code when we have 4 digit opt

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/services.dart';
// import 'package:konkan_bite_food/core/config/routes.dart';
// import 'package:konkan_bite_food/feature1/authentication/presentation/auth_bloc/auth_bloc.dart';
// import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
// import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
// import 'package:konkan_bite_food/widgets/custom_button.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   final String? mobileNumber;
//   const OtpVerificationScreen({super.key, this.mobileNumber});

//   @override
//   OtpVerificationScreenState createState() => OtpVerificationScreenState();
// }

// class OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final List<TextEditingController> otpControllers =
//       List.generate(6, (index) => TextEditingController());
//   final List<FocusNode> otpFocusNodes =
//       List.generate(6, (index) => FocusNode());
//   final _formKey = GlobalKey<FormState>();
//   int countdown = 50;
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     startCountdown();
//   }

//   void startCountdown() {
//     timer?.cancel();
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (countdown > 0) {
//         setState(() {
//           countdown--;
//         });
//       } else {
//         timer.cancel();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     for (var controller in otpControllers) {
//       controller.dispose();
//     }
//     for (var node in otpFocusNodes) {
//       node.dispose();
//     }
//     timer?.cancel();
//     super.dispose();
//   }

//   String _getOtp() {
//     return otpControllers.map((controller) => controller.text).join();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mobileNumber = widget.mobileNumber ?? 'Unknown';
//     bool isEnable =
//         otpControllers.every((controller) => controller.text.isNotEmpty);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: BlocListener<AuthBloc, AuthState>(
//         listener: (context, state) {
//           if (state is AuthOtpVerificationSuccessState) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('OTP verified successfully')),
//             );
//             Navigator.pushReplacementNamed(context, Routes.locationAccessRoute);
//           } else if (state is AuthOtpReceivedFailureState ||
//               state is AuthFailure) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(
//                     'Error: ${state is AuthOtpReceivedFailureState ? state.errorMessage : (state as AuthFailure).errorMessage}'),
//                 backgroundColor: const Color.fromARGB(255, 236, 170, 166),
//               ),
//             );
//           }
//         },
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: const Icon(Icons.arrow_back,
//                           color: AppColors.deepNavy),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         "Verify Details",
//                         style: AppTextStyle.title1Medium
//                             .copyWith(color: AppColors.deepNavy),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 60),
//                 const Center(
//                   child: Text(
//                     "Please enter the OTP we have just sent to",
//                     style: TextStyle(fontSize: 17, color: Colors.black54),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Center(
//                   child: Text(
//                     "+91 $mobileNumber",
//                     style: AppTextStyle.caption1
//                         .copyWith(color: AppColors.deepNavy),
//                   ),
//                 ),
//                 const SizedBox(height: 70),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     'Enter OTP',
//                     style: AppTextStyle.caption2
//                         .copyWith(color: AppColors.oliveGreen),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: List.generate(6, (index) {
//                     return Expanded(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                         child: TextFormField(
//                           controller: otpControllers[index],
//                           focusNode: otpFocusNodes[index],
//                           keyboardType: TextInputType.number,
//                           textAlign: TextAlign.center,
//                           maxLength: 1,
//                           inputFormatters: [
//                             FilteringTextInputFormatter.digitsOnly,
//                           ],
//                           decoration: InputDecoration(
//                             counterText: "",
//                             filled: true,
//                             fillColor: AppColors.lightBlueGrey,
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide:
//                                   const BorderSide(color: AppColors.softBlue),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide:
//                                   const BorderSide(color: AppColors.softBlue),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(color: Colors.red),
//                             ),
//                             focusedErrorBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: const BorderSide(color: Colors.red),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return '';
//                             }
//                             if (!RegExp(r'^\d$').hasMatch(value)) {
//                               return '';
//                             }
//                             return null;
//                           },
//                           onChanged: (value) {
//                             if (value.isNotEmpty && index < 5) {
//                               FocusScope.of(context).nextFocus();
//                             } else if (value.isEmpty && index > 0) {
//                               FocusScope.of(context).previousFocus();
//                             }
//                             setState(() {}); // Update isEnable
//                           },
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 30),
//                 BlocBuilder<AuthBloc, AuthState>(
//                   builder: (context, state) {
//                     return CustomActionButton.orangeFilled(
//                       text: "VERIFY",
//                       isEnable: isEnable,
//                       onPressed: () {
//                         if (isEnable && state is! AuthLoading) {
//                           if (_formKey.currentState!.validate()) {
//                             context.read<AuthBloc>().add(
//                                   VerifyOtpEvent(_getOtp()),
//                                 );
//                           }
//                         }
//                       },
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 Center(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Didn't receive OTP?",
//                         style: AppTextStyle.caption2
//                             .copyWith(color: AppColors.oliveGreen),
//                       ),
//                       const SizedBox(width: 5),
//                       countdown > 0
//                           ? Row(
//                               children: [
//                                 Text(
//                                   "Resend",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     decoration: TextDecoration.underline,
//                                     decorationThickness: 2.0,
//                                     color: AppColors.deepNavy,
//                                     height: 2,
//                                   ),
//                                 ),
//                                 Text(
//                                   " in $countdown sec",
//                                   style: AppTextStyle.caption2
//                                       .copyWith(color: AppColors.oliveGreen),
//                                 ),
//                               ],
//                             )
//                           : GestureDetector(
//                               onTap: () {
//                                 context.read<AuthBloc>().add(
//                                       LoginWithOtpEvent(mobileNumber),
//                                     );
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('OTP resent')),
//                                 );
//                                 setState(() {
//                                   countdown = 50;
//                                   startCountdown();
//                                 });
//                               },
//                               child: const Text(
//                                 "Resend",
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   decoration: TextDecoration.underline,
//                                   decorationThickness: 2.0,
//                                   color: AppColors.deepNavy,
//                                   height: 2,
//                                 ),
//                               ),
//                             ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//third screen

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/feature1/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String? mobileNumber;
  const OtpVerificationScreen({super.key, this.mobileNumber});

  @override
  OtpVerificationScreenState createState() => OtpVerificationScreenState();
}

class OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> otpControllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> otpFocusNodes =
      List.generate(6, (index) => FocusNode());
  final _formKey = GlobalKey<FormState>();
  int countdown = 50;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer?.cancel();
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

  String _getOtp() {
    return otpControllers.map((controller) => controller.text).join();
  }

  void _clearOtpFields() {
    for (var controller in otpControllers) {
      controller.clear();
    }
    setState(() {}); // Update isEnable
  }

  @override
  Widget build(BuildContext context) {
    final mobileNumber = widget.mobileNumber ?? 'Unknown';
    bool isEnable =
        otpControllers.every((controller) => controller.text.isNotEmpty);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthOtpVerificationSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP verified successfully')),
            );
            Navigator.pushReplacementNamed(context, Routes.locationAccessRoute);
          } else if (state is AuthOtpReceivedSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP resent successfully')),
            );
            _clearOtpFields();
          } else if (state is AuthOtpReceivedFailureState ||
              state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Error: ${state is AuthOtpReceivedFailureState ? state.errorMessage : (state as AuthFailure).errorMessage}'),
                backgroundColor: const Color.fromARGB(255, 236, 170, 166),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back,
                          color: AppColors.deepNavy),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Verify Details",
                        style: AppTextStyle.title1Medium
                            .copyWith(color: AppColors.deepNavy),
                      ),
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
                    "+91 $mobileNumber",
                    style: AppTextStyle.caption1
                        .copyWith(color: AppColors.deepNavy),
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Enter OTP',
                    style: AppTextStyle.caption2
                        .copyWith(color: AppColors.oliveGreen),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextFormField(
                          controller: otpControllers[index],
                          focusNode: otpFocusNodes[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: AppColors.lightBlueGrey,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: AppColors.softBlue),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: AppColors.softBlue),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            if (!RegExp(r'^\d$').hasMatch(value)) {
                              return '';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                            setState(() {}); // Update isEnable
                          },
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return CustomActionButton.orangeFilled(
                      text: "VERIFY",
                      isEnable: isEnable,
                      onPressed: () {
                        if (isEnable && state is! AuthLoading) {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  VerifyOtpEvent(_getOtp()),
                                );
                          }
                        }
                      },
                    );
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
                      countdown > 0 ||
                              context.watch<AuthBloc>().state is AuthLoading
                          ? Row(
                              children: [
                                Text(
                                  "Resend",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2.0,
                                    color: AppColors.deepNavy.withOpacity(0.5),
                                    height: 2,
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
                                context.read<AuthBloc>().add(
                                      LoginWithOtpEvent(mobileNumber),
                                    );
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
                                  color: AppColors.deepNavy,
                                  height: 2,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
