import 'package:http/http.dart' as _httpService;
import 'package:konkan_bite_food/core1/errors/exceptions.dart';
import 'package:konkan_bite_food/core1/resources/api_endponts.dart';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/features/address/data/models/address_models.dart';

abstract class AddressRemoteDataSource {
  Future<AddressModel> fetchAddress();
  Future<void> addAddress(AddressModel address);
  Future<void> updateAddress(AddressModel address);
  Future<void> deleteAddress(String addressId);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final HttpService _httpService;

  const AddressRemoteDataSourceImpl(this._httpService);

  @override
  Future<AddressModel> fetchAddress() async {
    try {
      final endpoint = ApiEndpoints.getAddress;
      final response = await _httpService.get(
        endpoint,
        parser: (data) => AddressModel.fromJson(data),
        isPublic: true, // Mark as public endpoint
      );
      return response;
    } on HttpException catch (e) {
      throw APIException(
        message: e.message,
        statusCode: _extractStatusCode(e.message),
      );
    } catch (e) {
      throw APIException(message: 'Unexpected error: $e', statusCode: 500);
    }
  }

  int _extractStatusCode(String message) {
    final match = RegExp(r'(\d{3})').firstMatch(message);
    return match != null ? int.parse(match.group(0)!) : 500;
  }

  @override
  Future<void> addAddress(AddressModel address) async {
    final response = await _httpService.post(
      '/store/add',
      body: address.toJson(),
    );

    if (response.statusCode != 200) {
      throw APIException(
        message: response.data['responseMessage'] ?? 'Something went wrong',
        statusCode: response.statusCode ?? 400,
      );
    }
  }

  @override
  Future<void> updateAddress(AddressModel address) async {
    final response = await _httpService.put(
      '/update/add/${address.id}',
      body: address.toJson(),
    );

    if (response.statusCode != 200) {
      throw APIException(
        message: response.data['responseMessage'] ?? 'Something went wrong',
        statusCode: response.statusCode ?? 400,
      );
    }
  }

  @override
  Future<void> deleteAddress(String addressId) async {
    final response = await _httpService.delete('/delete/add/$addressId');

    if (response.statusCode != 200) {
      throw APIException(
        message: response.data['responseMessage'] ?? 'Something went wrong',
        statusCode: response.statusCode ?? 400,
      );
    }
  }
}
