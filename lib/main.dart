import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:konkan_bite_food/config/environment.dart';
import 'package:konkan_bite_food/core1/resources/app_routes.dart';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/core1/services/secure_storage_service.dart';
import 'package:konkan_bite_food/feature1/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:konkan_bite_food/feature1/authentication/data/repositories/auth_repo_impl.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/repositories/auth_repository.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:konkan_bite_food/feature1/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
import 'package:konkan_bite_food/features/address/presnetation/bloc/add_bloc.dart';
import 'package:konkan_bite_food/features/dashboard_screen/bloc/home.bloc.dart';
import 'package:konkan_bite_food/features/dashboard_screen/bloc/home.event.dart';
import 'package:konkan_bite_food/features/dashboard_screen/datasource/datasource.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AppConfig with the desired environment
  await AppConfig.init('dev');

  final secureStorage = SecureStorageService();

  // Use AppConfig.baseUrl for HttpService
  final httpService = HttpService(
    baseUrl: AppConfig.baseUrl,
    client: http.Client(),
    secureStorageService: secureStorage,
  );

  final authRemoteDataSource = AuthRemoteDataSourceImpl(httpService);
  final authRepository = AuthRepoImpl(authRemoteDataSource);
  final addressRepository = AddressRepository(httpService);
  final dashboardApiService = DashboardApiService(httpService);

  runApp(MyApp(
    secureStorage: secureStorage,
    authRepository: authRepository,
    addressRepository: addressRepository,
    dashboardApiService: dashboardApiService,
  ));
}

class MyApp extends StatelessWidget {
  final SecureStorageService secureStorage;
  final AuthenticationRepository authRepository;
  final AddressRepository addressRepository;
  final DashboardApiService dashboardApiService;

  const MyApp({
    super.key,
    required this.secureStorage,
    required this.authRepository,
    required this.addressRepository,
    required this.dashboardApiService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            secureStorage: secureStorage,
            repository: authRepository,
            verifyOtpUsecase: VerifyOtpUsecase(authRepository),
          )..add(AuthCheckEvent()),
        ),
        BlocProvider(
          create: (_) => AddressBloc(addressRepository),
        ),
        BlocProvider(
          create: (_) =>
              HomeBloc(dashboardApiService)..add(FetchDashboardData()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:
            AppRoutes.loginRoute, // Use the initial route from the Routes class
        onGenerateRoute:
            AppRoutes.generateRoute, // Use the route generator function
      ),
    );
  }
}
