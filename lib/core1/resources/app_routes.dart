import 'package:flutter/material.dart';
import 'package:konkan_bite_food/feature1/authentication/presentation/auth_screen.dart';
import 'package:konkan_bite_food/feature1/authentication/presentation/otp_verification_screen.dart';
import 'package:konkan_bite_food/feature1/home/presentation/home_screen.dart';
import 'package:konkan_bite_food/features/auth/login_screen.dart';

//routes from prachi
import 'package:konkan_bite_food/features/auth/presentation/address_detail_sheet/address_details_screen.dart';
import 'package:konkan_bite_food/features/auth/location_access_screen.dart';
import 'package:konkan_bite_food/features/auth/location_selection_screen.dart';
import 'package:konkan_bite_food/features/auth/otp_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/order_place_bsheet.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/dashboard_screen/dashboard_home_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/location_edit_manually_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_tracking_Map_Screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/paymnet_screen/payment_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/edit_personal_info_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_details_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String otpVerification = '/otp-verification';
  static const String home = '/home';
  // Routes from prachi
  static const String loginRoute = '/login';
  static const String otpRoute = '/otp';
  static const String locationAccessRoute = '/location_access';
  static const String locationEditManuallyRoute = '/location_edit_manually';
  static const String locationSelectionRoute = '/location_selection';
  static const String addressDetailsRoute = '/address_details';
  static const String dashboardhomeRoute = '/dashboard_home';
  static const String cartRoute = '/cart';
  static const String paymentRoute = '/payment';
  static const String orderplaceBSheetRoute = '/order_place_bsheet';
  static const String orderTrackingRoute = '/order_tracking';
  static const String profileDetailRoute = '/profile_detail';
  static const String personalInfoRoute = '/personal_info';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case otpVerification:
        final args = settings.arguments as Map<String, dynamic>?;
        final mobileNumber = args?['mobileNumber'] as String?;
        return MaterialPageRoute(
          builder: (_) => OtpVerificationScreen(mobileNumber: mobileNumber),
        );
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case locationAccessRoute:
        return MaterialPageRoute(builder: (_) => const LocationAccessScreen());
      case locationEditManuallyRoute:
        return MaterialPageRoute(
            builder: (_) => const LocationEditManuallyScreen());
      case locationSelectionRoute:
        return MaterialPageRoute(builder: (_) => LocationSelectionScreen());
      case addressDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const AddressDetailsBottomSheet());
      case dashboardhomeRoute:
        return MaterialPageRoute(builder: (_) => const DashboardHomeScreen());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case orderplaceBSheetRoute:
        return MaterialPageRoute(builder: (_) => const OrderProgressWidget());
      case orderTrackingRoute:
        return MaterialPageRoute(builder: (_) => const OrderTrackingScreen());
      case profileDetailRoute:
        return MaterialPageRoute(builder: (_) => const ProfileDetailScreen());
      case personalInfoRoute:
        return MaterialPageRoute(builder: (_) => const PersonalInfoScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

// Define all your routes here as constants
class Routes {
  static const String loginRoute = '/login';
  static const String otpRoute = '/otp';
  static const String locationAccessRoute = '/location_access';
  static const String locationEditManuallyRoute = '/location_edit_manually';
  static const String locationSelectionRoute = '/location_selection';
  static const String addressDetailsRoute = '/address_details';
  static const String dashboardhomeRoute = '/dashboard_home';
  static const String cartRoute = '/cart';
  static const String paymentRoute = '/payment';
  static const String orderplaceBSheetRoute = '/order_place_bsheet';
  static const String orderTrackingRoute = '/order_tracking';
  static const String profileDetailRoute = '/profile_detail';
  static const String personalInfoRoute = '/personal_info';

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
        return MaterialPageRoute(builder: (_) => LocationSelectionScreen());
      case addressDetailsRoute:
        return MaterialPageRoute(
            builder: (_) => const AddressDetailsBottomSheet());
      case dashboardhomeRoute:
        return MaterialPageRoute(builder: (_) => const DashboardHomeScreen());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case orderplaceBSheetRoute:
        return MaterialPageRoute(builder: (_) => const OrderProgressWidget());
      case orderTrackingRoute:
        return MaterialPageRoute(builder: (_) => const OrderTrackingScreen());
      case profileDetailRoute:
        return MaterialPageRoute(builder: (_) => const ProfileDetailScreen());
      case personalInfoRoute:
        return MaterialPageRoute(builder: (_) => const PersonalInfoScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen()); // Default route
    }
  }
}
