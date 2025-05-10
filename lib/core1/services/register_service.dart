// import 'package:get_it/get_it.dart';
// import 'package:kokan_app/core/services/api_services.dart';
// import 'package:kokan_app/core/services/secure_storage_service.dart';
// import 'package:kokan_app/feature/authentication/data/datasources/auth_remote_data_source.dart';
// import 'package:kokan_app/feature/authentication/data/repositories/auth_repo_impl.dart';
// import 'package:kokan_app/feature/authentication/domain/repositories/auth_repository.dart';
// import 'package:kokan_app/main.dart';

// final sl = GetIt.instance;

// void setupDependencies() {
//   sl.registerLazySingleton<SecureStorageService>(
//     () => SecureStorageService(),
//   );
//   sl.registerLazySingleton<HttpService>(
//     () => HttpService(
//       baseUrl: 'https://api.yourapp.com',
//       secureStorageService: sl(),
//     ),
//   );
//   sl.registerLazySingleton<AuthRemoteDataSrc>(
//     () => AuthRemoteDataSourceImpl(sl()),
//   );
//   sl.registerLazySingleton<AuthenticationRepository>(
//     () => AuthRepoImpl(sl()),
//   );
// }
