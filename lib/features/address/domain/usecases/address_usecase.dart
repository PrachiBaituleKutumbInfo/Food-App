// import 'package:konkan_bite_food/core1/use_cases/usecase.dart';
// import 'package:konkan_bite_food/core1/utils/typedef.dart';
// import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
// import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';
// import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

// class StoreAddressUsecase extends UsecaseWithParams<AddressEntity, AddressModel> {
//   final AddressRepository repository;

//   StoreAddressUsecase(this.repository);

//   @override

//   ResultFuture<AddressEntity> call(address) async =>
//     repository.storeAddress(address);

// }

// typedef ResultFuture<T> = Future<Either<Failure, T>>;

import 'package:konkan_bite_food/core1/utils/typedef.dart';
import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';
import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

class AddAddressUsecase {
  final AddressRepository repo;

  AddAddressUsecase(this.repo);

  ResultFuture<void> call(AddressEntity address) => repo.addAddress(address);
}

class FetchAddressUsecase {
  final AddressRepository repo;

  FetchAddressUsecase(this.repo);

  ResultFuture<List<AddressEntity>> call() => repo.fetchAddress();
}

class UpdateAddress {
  final AddressRepository repo;

  UpdateAddress(this.repo);

  ResultFuture<void> call(AddressEntity address) => repo.updateAddress(address);
}

class DeleteAddress {
  final AddressRepository repo;

  DeleteAddress(this.repo);

  ResultFuture<void> call(String id) => repo.deleteAddress(id);
}
