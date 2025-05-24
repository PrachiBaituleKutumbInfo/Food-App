// import 'package:konkan_bite_food/core1/services/api_services.dart';
// import 'package:konkan_bite_food/core1/utils/typedef.dart';

// class AddressRepository {
//   final HttpService httpService;

//   AddressRepository(this.httpService);

//   ResultFuture<void> get storeAddres => null;

//   Future<String> storeAddress(Map<String, dynamic> addressData) async {
//     return await httpService.post<String>(
//       '/storeAddress',
//       body: addressData,
//       parser: (response) => response['message'] ?? 'Address saved successfully',
//     );
//   }
// }

// import 'package:konkan_bite_food/core1/utils/typedef.dart';
// import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';

// abstract class AddressRepository {
//   const AddressRepository();
//   ResultFuture<List<AddressEntity>> fetchAddresses();

//   // ResultFuture<AddressRepository> fetchAddresses(AddressModel address) {}
// }

import 'package:dartz/dartz.dart';
import 'package:konkan_bite_food/core1/errors/failures.dart';
import '../entities/address_entity.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<AddressEntity>>> fetchAddress();
  Future<Either<Failure, void>> addAddress(AddressEntity address);
  Future<Either<Failure, void>> updateAddress(AddressEntity address);
  Future<Either<Failure, void>> deleteAddress(String addressId);
}
