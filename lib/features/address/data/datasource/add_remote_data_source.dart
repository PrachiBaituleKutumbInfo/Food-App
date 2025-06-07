// import 'package:http/http.dart' as _httpService;
// import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// import 'package:konkan_bite_food/core1/resources/api_endponts.dart';
// import 'package:konkan_bite_food/core1/services/api_services.dart';
// import 'package:konkan_bite_food/features/address/data/models/address_fetch_response.dart';

// abstract class AddressRemoteDataSource {
//   Future<AddressModel> fetchAddress();
//   Future<void> addAddress(AddressModel address);
//   Future<void> updateAddress(AddressModel address);
//   Future<void> deleteAddress(String addressId);
// }

// class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
//   final HttpService _httpService;

//   const AddressRemoteDataSourceImpl(this._httpService);

//   @override
//   Future<AddressModel> fetchAddress() async {
//     try {
//       final endpoint = ApiEndpoints.getAddress;
//       final response = await _httpService.get(
//         endpoint,
//         parser: (data) => AddressModel.fromJson(data),
//         isPublic: true, // Mark as public endpoint
//       );
//       return response;
//     } on HttpException catch (e) {
//       throw APIException(
//         message: e.message,
//         statusCode: _extractStatusCode(e.message),
//       );
//     } catch (e) {
//       throw APIException(message: 'Unexpected error: $e', statusCode: 500);
//     }
//   }

//   int _extractStatusCode(String message) {
//     final match = RegExp(r'(\d{3})').firstMatch(message);
//     return match != null ? int.parse(match.group(0)!) : 500;
//   }

//   @override
//   Future<void> addAddress(AddressModel address) async {
//     final response = await _httpService.post(
//       '/store/add',
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

// import 'package:konkan_bite_food/core1/errors/exceptions.dart';
// import 'package:konkan_bite_food/core1/resources/api_endponts.dart';
// import 'package:konkan_bite_food/core1/services/api_services.dart';
// import 'package:konkan_bite_food/features/address/data/models/address_fetch_response.dart';

// abstract class AddressRemoteDataSource {
//   Future<AddressResponseData> fetchAddress();
//   Future<void> addAddress(AddressModel address);
//   Future<void> updateAddress(AddressModel address);
//   Future<void> deleteAddress(String addressId);
// }

// class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
//   final HttpService _httpService;

//   const AddressRemoteDataSourceImpl(this._httpService);

//   @override
//   Future<AddressResponseData> fetchAddress() async {
//     try {
//       final endpoint = ApiEndpoints.getAddress;
//       final response = await _httpService.get(
//         endpoint,
//         parser: (data) => UserAddressResponse.fromJson(data).responseData,
//         isPublic: true,
//       );
//       return response;
//     } on HttpException catch (e) {
//       throw APIException(
//         message: e.message,
//         statusCode: _extractStatusCode(e.message),
//       );
//     } catch (e) {
//       throw APIException(message: 'Unexpected error: $e', statusCode: 500);
//     }
//   }

//   int _extractStatusCode(String message) {
//     final match = RegExp(r'(\d{3})').firstMatch(message);
//     return match != null ? int.parse(match.group(0)!) : 500;
//   }

//   @override
//   Future<void> addAddress(AddressModel address) async {
//     final response = await _httpService.post(
//       ApiEndpoints.storeAddress,
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
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart' as _httpService;
import 'package:konkan_bite_food/core1/resources/api_endponts.dart';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/features/address/data/models/address_fetch_response.dart';

abstract class AddRemoteDataSource {
  Future<List<Address>> fetchAddresses();
}

class AddressRepository implements AddRemoteDataSource {
  const AddressRepository(this._httpService);

  final HttpService _httpService;
  // final String baseUrl = '/get/add';

  // Future<List<Address>> fetchAddresses() async {
  // final response = await http.get(Uri.parse('/get/add'));
  //  final url = Uri.parse('/get/add');

  //   final url = Uri.parse(ApiEndpoints.getAddress);
  //   final response = await httpService.get(
  //     url,
  //     headers: {'Content-Type': 'application/json'},
  //   );
  //   if (response.statusCode == 200) {
  //     final data = json.decode(response.body)['responseData'];
  //     List<Address> addresses = [];

  //     for (var type in ['HOME', 'OFFICE', 'OTHER']) {
  //       if (data[type] != null) {
  //         addresses.add(Address.fromJson(data[type]));
  //         print("Raw response body: ${response.body}");
  //       }
  //     }
  //     return addresses;
  //   } else {
  //     throw Exception('Failed to load addresses');
  //   }
  // }
  @override
  Future<List<Address>> fetchAddresses() async {
    final response = await _httpService.get('/get/add');
    print("Raw response body: ${response.body}");
    // print('base Url $response');
    if (response.statusCode == 200) {
      // final data = json.decode(response.body)['responseData'];
      final jsonBody = json.decode(response.body);
      final data = jsonBody['responseData'];
      List<Address> addresses = [];

      for (var type in ['HOME', 'OFFICE', 'OTHER']) {
        if (data[type] != null) {
          addresses.add(Address.fromJson(data[type]));
        }
      }
      //  print("Raw response body: ${response.body}");
      return addresses;
    } else {
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
