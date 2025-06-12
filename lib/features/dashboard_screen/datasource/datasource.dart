import 'dart:convert';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/features/dashboard_screen/model/model.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuSection>> fetchMenu();
}

class DashboardApiService implements MenuRemoteDataSource {
   final HttpService _httpService;
  DashboardApiService(this._httpService);

 

  // @override
  // Future<List<MenuSection>> fetchMenu() async {
  //   try {
  //     final response = await _httpService.get('/get-pop-menu/bydate?date=');
  //     print("Raw response body: ${response}");

  //     final jsonBody = jsonDecode(response);

  //     if (jsonBody['responseData'] is List) {
  //       final List<dynamic> data = jsonBody['responseData'];
  //       final List<MenuSection> menuItems =
  //           data.map((item) => MenuSection.fromJson(item)).toList();

  //       return menuItems;
  //     } else {
  //       throw Exception('Invalid response data format');
  //     }
  //   } catch (e) {
  //     print('Error while fetching menu items: $e');
  //     throw Exception('Failed to load menu items');
  //   }
  // }
  @override
  Future<List<MenuSection>> fetchMenu() async {
    try {
      final responseBody = await _httpService.get('/get-pop-menu/bydate?date=');
      final jsonBody = jsonDecode(responseBody);
      final data = jsonBody['responseData'] ?? [];

      return data.map<MenuSection>((e) => MenuSection.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Failed to load menu: $e');
    }
  }
}

    //   final response  = await _httpService.get('/get-pop-menu/bydate?date=');
    //   if (response.statusCode == 200) {
    //     final data = jsonDecode(response.body)['responseData'];
    //     return data.map((e) => MenuSection.fromJson(e)).toList();
    //   } else {
    //     throw Exception('Failed to load menu');
    //   }
  