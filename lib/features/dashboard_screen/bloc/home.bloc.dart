import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konkan_bite_food/features/dashboard_screen/bloc/home.event.dart';
import 'package:konkan_bite_food/features/dashboard_screen/bloc/home.state.dart';
import 'package:konkan_bite_food/features/dashboard_screen/datasource/datasource.dart';
import 'package:konkan_bite_food/features/dashboard_screen/model/model.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DashboardApiService apiService;

  HomeBloc(this.apiService) : super(HomeInitial()) {
    on<FetchDashboardData>(_onFetch);
    on< AddToCartEvent >(_onAddToCart);
    on< RemoveFromCartEvent >(_onRemoveFromCart);
  }

  Future<void> _onFetch(FetchDashboardData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final sections = await apiService.fetchMenu();
      emit(HomeLoaded(sections));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void _onAddToCart(AddToCartEvent event, Emitter<HomeState> emit) {
    if (state is! HomeLoaded) return;
    final s = state as HomeLoaded;
    final cart = List<FoodItem>.from(s.cart);
    final idx = cart.indexWhere((i) => i.id == event.item.id);
    if (idx >= 0) {
      cart[idx] = cart[idx].copyWith(quantity: cart[idx].quantity + 1);
    } else {
      cart.add(event.item.copyWith(quantity: 1));
    }
    emit(HomeLoaded(s.sections, cart: cart));
  }

  void _onRemoveFromCart(RemoveFromCartEvent event, Emitter<HomeState> emit) {
    if (state is! HomeLoaded) return;
    final s = state as HomeLoaded;
    final cart = List<FoodItem>.from(s.cart);
    final idx = cart.indexWhere((i) => i.id == event.item.id);
    if (idx >= 0) {
      final q = cart[idx].quantity - 1;
      if (q <= 0) cart.removeAt(idx);
      else cart[idx] = cart[idx].copyWith(quantity: q);
      emit(HomeLoaded(s.sections, cart: cart));
    }
  }
}

// // internal events:
// class _AddToCartEvent {
//   final FoodItem item;
//   _AddToCartEvent(this.item);
// }
// class _RemoveFromCartEvent {
//   final FoodItem item;
//   _RemoveFromCartEvent(this.item);
// }
