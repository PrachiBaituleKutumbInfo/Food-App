
import 'package:konkan_bite_food/features/dashboard_screen/model/model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<MenuSection> sections;
  final List<FoodItem> cart;

  HomeLoaded(this.sections, {this.cart = const []});
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
