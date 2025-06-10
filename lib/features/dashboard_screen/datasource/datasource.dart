import 'dart:convert';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/features/dashboard_screen/model/model.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuSection>> fetchMenu();
}
class DashboardApiService implements MenuRemoteDataSource {
  DashboardApiService(this._httpService);
  
  final HttpService _httpService;
  

  @override
  Future<List<MenuSection>> fetchMenu() async {
    final resp = await _httpService.get('/get-pop-menu/bydate?date=');
    if (resp.statusCode == 200) {
      final List data = jsonDecode(resp)['responseData'];
      return data.map((e) => MenuSection.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
