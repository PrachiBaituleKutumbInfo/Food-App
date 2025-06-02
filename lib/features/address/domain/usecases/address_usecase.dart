

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

  ResultFuture<AddressEntity> call() => repo.fetchAddress();
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
