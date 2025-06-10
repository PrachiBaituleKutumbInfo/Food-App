import 'package:konkan_bite_food/features/dashboard_screen/model/model.dart';

abstract class HomeEvent {}

class FetchDashboardData extends HomeEvent {}

class AddToCartEvent extends HomeEvent {
  final FoodItem item;
  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends HomeEvent {
  final FoodItem item;
  RemoveFromCartEvent(this.item);
}
