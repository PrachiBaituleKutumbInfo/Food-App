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

  //   Future<List<AddressModel>> fetchAddress() async {
//   final response = await _http.get('/get/add');

//   if (response.statusCode == 200 &&
//       response.data['responseStatus'] == 'SUCCESS') {
//     final Map<String, dynamic> data = response.data['responseData'];

//     // Only get non-null address entries (like HOME, OFFICE, OTHER)
//     final List<AddressModel> addresses = [];

//     data.forEach((key, value) {
//       if (value != null) {
//         addresses.add(AddressModel.fromJson(value));
//       }
//     });

//     return addresses;
//   } else {
//     throw APIException(
//       message: response.data['responseMessage'] ?? 'Something went wrong',
//       statusCode: response.statusCode ?? 400,
//     );
//   }
// }

  // @override
  // Future<List<AddressModel>> fetchAddress() async {
  //   try {
  //     const endpoint = ApiEndpoints.getAddress;

  //     final response = await _http.get(
  //       endpoint,
  //       parser: (data) => (data['responseData'] as List)
  //           .map((e) => AddressModel.fromJson(e))
  //           .toList(),
  //     );
  //     return response;
  //   } on HttpException catch (e) {
  //     throw APIException(
  //       message: e.message,
  //       statusCode: 400,
  //     );
  //   } catch (e) {
  //     throw APIException(message: 'Unexpected error: $e', statusCode: 500);
  //   }
  // }

  @override
  Future<List<AddressModel>> fetchAddress() async {
  final response = await _http.get('/get/add');

  if (response.statusCode == 200 &&
      response.data['responseStatus'] == 'SUCCESS') {
    final List<dynamic> data = response.data['responseData'];
    return data.map((json) => AddressModel.fromJson(json)).toList();
  } else {
    throw APIException(
      message: response.data['responseMessage'] ?? 'Something went wrong',
      statusCode: response.statusCode ?? 400,
    );
  }
}

//   Future<List<AddressModel>> fetchAddress() async {
//   final response = await _http.get('/get/add');

//   if (response.statusCode == 200) {
//     final List<dynamic> data = response.data['responseData']; // ✅ Corrected
//     return data.map((json) => AddressModel.fromJson(json)).toList();
//   } else {
//     throw APIException(
//       message: response['responseMessage'] ?? 'Something went wrong',
//       statusCode: 400,
//     );
//   }
// }

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
