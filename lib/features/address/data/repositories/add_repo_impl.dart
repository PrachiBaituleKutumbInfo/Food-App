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
Future<Either<Failure, AddressEntity>> fetchAddress() async {
  try {
    final result = await _remoteDataSource.fetchAddress(); // result is AddressModel
    final entity = result.toEntity(); // convert to AddressEntity
    return Right(entity);
  } on APIException catch (e) {
    print('APIException: ${e.message}');
    return Left(ApiFailure.fromException(e));
  } catch (e) {
    print('Unexpected Error: $e');
    return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
  }
}



  // Future<Either<Failure, AddressEntity>>fetchAddress() async {
  //   try {
  //     final result = await _remoteDataSource.fetchAddress();
  //     final entities = result.map((model) => model.toEntity()).toList();
  //     return Right(entities);
  //   } on APIException catch (e) {
  //     print('APIException: ${e.message}');
  //     return Left(ApiFailure.fromException(e));
  //   } catch (e) {
  //     print('Unexpected Error: $e');
  //     return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
  //   }
  // }

  @override
  Future<Either<Failure, void>> addAddress(AddressEntity address) async {
    try {
      final model = AddressModel.fromEntity(address);
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
      final model = AddressModel.fromEntity(address);
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
}
