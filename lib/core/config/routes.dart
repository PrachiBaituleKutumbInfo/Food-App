// routes.dart
import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/address_details_screen.dart';
import 'package:konkan_bite_food/features/auth/location_access_screen.dart';
import 'package:konkan_bite_food/features/auth/location_selection_screen.dart';
import 'package:konkan_bite_food/features/auth/login_screen.dart';
import 'package:konkan_bite_food/features/auth/otp_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/location_edit_manually_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/home_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_tracking_Map_Screen.dart';

// Define all your routes here as constants
class Routes {
  static const String loginRoute = '/login';
  static const String otpRoute = '/otp';
  static const String locationAccessRoute = '/location_access';
  static const String locationEditManuallyRoute = '/location_edit_manually';
  static const String locationSelectionRoute = '/location_selection';
  static const String addressDetailsRoute = '/address_details';
    static const String homeRoute = '/home';
        static const String orderTrackingRoute = '/order_tracking';

  // static String orderTrackRoute;



  // Generate routes based on the route names
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case locationAccessRoute:
        return MaterialPageRoute(builder: (_) => const LocationAccessScreen());
      case locationEditManuallyRoute:
        return MaterialPageRoute(
            builder: (_) => const LocationEditManuallyScreen());
      case locationSelectionRoute:
        return MaterialPageRoute(
            builder: (_) => LocationSelectionScreen());
      case addressDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const AddressDetailsBottomSheet());
            case homeRoute:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen());
            case orderTrackingRoute:
        return MaterialPageRoute(
            builder: (_) => const OrderTrackingScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen()); // Default route
            
    }
  }
}
