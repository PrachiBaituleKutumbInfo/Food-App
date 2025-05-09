import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_details_card_widget.dart';

class OrderCardList extends StatelessWidget {
  final List<Map<String, dynamic>> orders;

  const OrderCardList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return OrderCard(
          status: order['status'],
          date: order['date'],
          amount: order['amount'],
          items: List<Map<String, dynamic>>.from(order['items']),
          actions: List<String>.from(order['actions']),
        );
      },
    );
  }
}
