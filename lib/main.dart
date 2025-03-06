import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/location_access_screen.dart';
import 'package:konkan_bite_food/features/auth/location_selection_screen1.dart';
import 'package:konkan_bite_food/features/auth/login_screen.dart';
import 'package:konkan_bite_food/features/auth/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Define route names as constants to avoid typos
  static const String loginRoute = '/login';
  static const String otpRoute = '/otp';
  static const String locationAccessRoute = '/location_access';
  static const String locationSelectionRoute = '/location_selection';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: loginRoute,
      routes: {
        loginRoute: (context) => const LoginScreen(),
        otpRoute: (context) => const OtpScreen(),
        locationAccessRoute: (context) => const LocationAccessScreen(),
        locationSelectionRoute: (context) =>
            const LocationSelectionScreen(userLocation: '',),
      },
    );
  }
}