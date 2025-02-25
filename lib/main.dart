import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/location_access_screen.dart';
import 'package:konkan_bite_food/features/auth/login_screen.dart';
import 'package:konkan_bite_food/features/auth/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {'login': (context) => const LoginScreen(),
       'otp': (context) => const OtpScreen(),
      //  'location access':  (context) => const LocationAccessScreen()
       },
      // home: const LoginScreen(),
    );
  }
}
