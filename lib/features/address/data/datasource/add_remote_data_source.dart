// import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// import 'package:konkan_bite_food/core1/resources/api_endponts.dart';
// import 'package:konkan_bite_food/core1/services/api_services.dart';
// import 'package:konkan_bite_food/features/address/data/models/address_models.dart';

// class AddressRemoteDataSource {
//   final HttpService httpService;

//   AddressRemoteDataSource(this.httpService);

//   Future<AddressModel> storeAddress(AddressModel address) async {
//     final response = await httpService.post<Map<String, dynamic>>(
//       ApiEndpoints.storeAddress,
//       body: address.toJson(),
//       parser: (data) => data as Map<String, dynamic>,
//     );

//     if (response['responseStatus'] != 'SUCCESS') {
//       throw APIException(
//         message: response['responseMessage'] ?? 'Something went wrong',
//         statusCode: 400,
//       );
//     }
//   }
// }

// import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// import 'package:konkan_bite_food/core1/services/api_services.dart';
// import 'package:konkan_bite_food/features/address/data/models/address_models.dart';
// import 'package:konkan_bite_food/features/address/domain/entities/address_entity.dart';

// class AddressRemoteDataSource {
//   final HttpService api;

//   AddressRemoteDataSource(this.api);

//   Future<AddResponseEntity> storeAddress(AddressModel address) async {
//     final response = await api.post('/storeAddress', body: address.toJson());

//     if (response['responseStatus'] != 'SUCCESS') {
//       throw APIException(
//         message: response['responseMessage'] ?? 'Something went wrong',
//         statusCode: 400,
//       );
//     } else {
//       throw APIException(
//         message: response['responseMessage'] ?? 'Failed to save address',
//         statusCode: 400,
//       );
//     }
//   }
// }

import 'package:konkan_bite_food/core1/errors/exceptions.dart';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/features/address/data/models/address_models.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressModel>> fetchAddress();
  Future<void> addAddress(AddressModel address);
  Future<void> updateAddress(AddressModel address);
  Future<void> deleteAddress(String addressId);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final HttpService _http;

  const AddressRemoteDataSourceImpl(this._http);

  @override
  Future<List<AddressModel>> fetchAddress() async {
    final response = await _http.get('/get/add/');

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['data'];
      return data.map((json) => AddressModel.fromJson(json)).toList();
    } else {
      throw APIException(
        message: response['responseMessage'] ?? 'Something went wrong',
        statusCode: 400,
      );
    }
  }

  @override
  Future<void> addAddress(AddressModel address) async {
    final response = await _http.post(
      '/store/add',
      body: address.toJson(),
    );

    if (response.statusCode != 200) {
      throw APIException(
        message: response['responseMessage'] ?? 'Something went wrong',
        statusCode: 400,
      );
    }
  }

  @override
  Future<void> updateAddress(AddressModel address) async {
    final response = await _http.put(
      '/update/add/${address.id}',
      body: address.toJson(),
    );

    if (response.statusCode != 200) {
      throw APIException(
        message: response['responseMessage'] ?? 'Something went wrong',
        statusCode: 400,
      );
    }
  }

  @override
  Future<void> deleteAddress(String addressId) async {
    final response = await _http.delete('/delete/add/$addressId');

    if (response.statusCode != 200) {
      throw APIException(
        message: response['responseMessage'] ?? 'Something went wrong',
        statusCode: 400,
      );
    }
  }
}
