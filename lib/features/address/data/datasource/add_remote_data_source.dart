//   @override
//   Future<void> updateAddress(AddressModel address) async {
//     final response = await _httpService.put(
//       '/update/add/${address.id}',
//       body: address.toJson(),
//     );

//     if (response.statusCode != 200) {
//       throw APIException(
//         message: response.data['responseMessage'] ?? 'Something went wrong',
//         statusCode: response.statusCode ?? 400,
//       );
//     }
//   }

//   @override
//   Future<void> deleteAddress(String addressId) async {
//     final response = await _httpService.delete('/delete/add/$addressId');

//     if (response.statusCode != 200) {
//       throw APIException(
//         message: response.data['responseMessage'] ?? 'Something went wrong',
//         statusCode: response.statusCode ?? 400,
//       );
//     }
//   }
// }

//   @override
//   Future<void> updateAddress(AddressModel address) async {
//     final response = await _httpService.put(
//       '${ApiEndpoints.updateAddress}/${address.id}',
//       body: address.toJson(),
//     );

//     if (response.statusCode != 200) {
//       throw APIException(
//         message: response.data['responseMessage'] ?? 'Something went wrong',
//         statusCode: response.statusCode ?? 400,
//       );
//     }
//   }

//   @override
//   Future<void> deleteAddress(String addressId) async {
//     final response = await _httpService.delete('/delete/add/$addressId');

//     if (response.statusCode != 200) {
//       throw APIException(
//         message: response.data['responseMessage'] ?? 'Something went wrong',
//         statusCode: response.statusCode ?? 400,
//       );
//     }
//   }
// }

import 'dart:convert';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/features/address/data/models/address_fetch_response.dart';

abstract class AddRemoteDataSource {
  Future<List<Address>> fetchAddresses();
}

class AddressRepository implements AddRemoteDataSource {
  const AddressRepository(this._httpService);

  final HttpService _httpService;

  @override
  Future<List<Address>> fetchAddresses() async {
    try {
      final response = await _httpService.get('/get/add'); // Already a String
      print("Raw response body: $response");

      final jsonBody = json.decode(response);
      final data = jsonBody['responseData'];

      List<Address> addresses = [];

      for (var type in ['HOME', 'OFFICE', 'OTHER']) {
        if (data[type] != null) {
          addresses.add(Address.fromJson(data[type]));
        }
      }

      return addresses;
    } catch (e) {
      print('Error while fetching addresses: $e');
      throw Exception('Failed to load addresses');
    }
  }

  @override
  Future<void> addAddress(Address address) async {
    print('response $address');
    final response = await _httpService.post(
      '/store/add',
      // Uri.parse('/store/add'),
      headers: {'Content-Type': 'application/json'},
      body: address.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add address');
    }
  }
}
