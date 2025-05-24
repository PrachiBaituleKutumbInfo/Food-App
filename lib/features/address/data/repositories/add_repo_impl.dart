// // import 'package:dartz/dartz.dart';
// // import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// // import 'package:konkan_bite_food/core1/errors/failures.dart';
// // import 'package:konkan_bite_food/core1/utils/typedef.dart';
// // import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
// // import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
// // import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';
// // import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

// // class AddressRepoImpl implements AddressRepository {
// //  const AddressRepoImpl (this.getAddress,
// //  );
  
// //   final AddressRemoteDataSource getAddress

// //   @override
// //   ResultFuture<AddressEntity> storeAddress(
// //     AddressModel address) async {
// //     try {
// //       final result = await getAddress.storeAddress(address);
// //       return Right(result);
// //     } on APIException catch (e) {
// //       return Left(ApiFailure.fromException(e));
// //     } catch (e) {
// //       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
// //     }
// //   }
// // }

// // import 'package:dartz/dartz.dart';
// // import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// // import 'package:konkan_bite_food/core1/errors/failures.dart';
// // import 'package:konkan_bite_food/core1/utils/typedef.dart';
// // import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
// // import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';
// // import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

// // class AddressRepoImpl implements AddressRepository {
// //   const AddressRepoImpl(this._remoteDataSource);

// //   final AddressRemoteDataSource _remoteDataSource;

// //   @override
// //   ResultFuture<List<AddressEntity>> fetchAddresses() async {
// //     try {
// //       // No parameters passed here
// //       final result = await _remoteDataSource.fetchAddresses();
// //       return Right(result);
// //     } on APIException catch (e) {
// //       return Left(ApiFailure.fromException(e));
// //     } catch (e) {
// //       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
// //     }
// //   }
// // }

// // import 'package:dartz/dartz.dart';
// // import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// // import 'package:konkan_bite_food/core1/errors/failures.dart';
// // import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
// // import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';
// // import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

// // class AddressRepoImpl implements AddressRepository {
// //   final AddressRemoteDataSource _remoteDataSource;

// //   const AddressRepoImpl(this._remoteDataSource);

// //   @override
// //   Future<Either<Failure, List<AddressEntity>>> fetchAddresses() async {
// //     try {
// //       final result = await _remoteDataSource.fetchAddresses();
// //       return Right(result);
// //     } on APIException catch (e) {
// //       return Left(ApiFailure.fromException(e));
// //     } catch (e) {
// //       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, void>> addAddress(AddressEntity address) async {
// //     try {
// //       await _remoteDataSource.addAddress(address);
// //       return const Right(null);
// //     } on APIException catch (e) {
// //       return Left(ApiFailure.fromException(e));
// //     } catch (e) {
// //       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, void>> updateAddress(AddressEntity address) async {
// //     try {
// //       await _remoteDataSource.updateAddress(address);
// //       return const Right(null);
// //     } on APIException catch (e) {
// //       return Left(ApiFailure.fromException(e));
// //     } catch (e) {
// //       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, void>> deleteAddress(String addressId) async {
// //     try {
// //       await _remoteDataSource.deleteAddress(addressId);
// //       return const Right(null);
// //     } on APIException catch (e) {
// //       return Left(ApiFailure.fromException(e));
// //     } catch (e) {
// //       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
// //     }
// //   }
// // }

// import 'package:dartz/dartz.dart';
// import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// import 'package:konkan_bite_food/core1/errors/failures.dart';
// import 'package:konkan_bite_food/core1/utils/typedef.dart';
// import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
// import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
// import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';
// import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

// class AddressRepoImpl implements AddressRepository {
//   final AddressRemoteDataSource _remoteDataSource;

//   const AddressRepoImpl(this._remoteDataSource);

//   @override
//   ResultFuture<AddressModel> fetchAddresses() async {
//     try {
//       final result = await _remoteDataSource.fetchAddresses();
//       return Right(result); // already List<AddressModel> which extends AddressEntity
//     } on APIException catch (e) {
//       return Left(ApiFailure.fromException(e));
//     } catch (e) {
//       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> addAddress(AddressEntity address) async {
//     try {
//       final model = AddressModel.fromEntity(address);
//       await _remoteDataSource.addAddress(model);
//       return const Right(null);
//     } on APIException catch (e) {
//       return Left(ApiFailure.fromException(e));
//     } catch (e) {
//       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> updateAddress(AddressEntity address) async {
//     try {
//       final model = AddressModel.fromEntity(address);
//       await _remoteDataSource.updateAddress(model);
//       return const Right(null);
//     } on APIException catch (e) {
//       return Left(ApiFailure.fromException(e));
//     } catch (e) {
//       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> deleteAddress(String addressId) async {
//     try {
//       await _remoteDataSource.deleteAddress(addressId);
//       return const Right(null);
//     } on APIException catch (e) {
//       return Left(ApiFailure.fromException(e));
//     } catch (e) {
//       return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
//     }
//   }
// }


import 'package:dartz/dartz.dart';
import 'package:konkan_bite_food/core1/errors/exceptions.dart';
import 'package:konkan_bite_food/core1/errors/failures.dart';
import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';
import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

 class AddressRepoImpl implements AddressRepository {
  final AddressRemoteDataSource _remoteDataSource;

  const AddressRepoImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<AddressEntity>>> fetchAddress() async {
    try {
      final result = await _remoteDataSource.fetchAddress();
      return Right(result);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
    }
  }

  @override
  Future<Either<Failure, void>> addAddress(AddressEntity address) async {
    try {
      final model = AddressModel.fromJson(_addressEntityToJson(address));
      await _remoteDataSource.addAddress(model);
      return const Right(null);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
    }
  }

  @override
  Future<Either<Failure, void>> updateAddress(AddressEntity address) async {
    try {
      final model = AddressModel.fromJson(_addressEntityToJson(address));
      await _remoteDataSource.updateAddress(model);
      return const Right(null);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAddress(String addressId) async {
    try {
      await _remoteDataSource.deleteAddress(addressId);
      return const Right(null);
    } on APIException catch (e) {
      return Left(ApiFailure.fromException(e));
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
    }
  }

  Map<String, dynamic> _addressEntityToJson(AddressEntity address) {
    return {
      'id': address.id,
      'houseNumber': address.houseNumber,
      'buildingName': address.buildingName,
      'addressLineOne': address.addressLineOne,
      'nearbyLandmark': address.nearbyLandmark,
      'city': address.city,
      'state': address.state,
      'zipCode': address.zipCode,
      'country': address.country,
      'urName': address.urName,
      'mobNum': address.mobNum,
      'addressType': address.addressType,
      'storedate': address.storedate,
      'userId': address.userId,
      'primarymob': address.primarymob,
      'emailAdd': address.emailAdd,
      'primary': address.isPrimary,
    };
  }
}

// import 'package:konkan_bite_food/features/address/data/datasource/add_remote_data_source.dart';
// import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
// import 'package:konkan_bite_food/features/address/domain/repositories/add_repo.dart';

// abstract class AddressRepoImpl implements AddressRepository {

// final AddressRemoteDataSource _remoteDataSource;

//   const AddressRepoImpl(this._remoteDataSource);

//   Future<AddressModel>fetchAddresses(){
//     return
//       };
// }

