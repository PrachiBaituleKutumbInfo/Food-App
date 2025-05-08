import 'package:flutter/material.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_place_bsheet.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// **Header**
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10, left: 5),
            child: Row(
              children: [
                /// Back button on the left
                CircularBackButton(
                  onPressed: () => Navigator.pop(context),
                ),

                /// Centered title
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: HeaderTitle(
                      title: 'Payment',
                    ),
                  ),
                ),
              ],
            ),
          ),

          const HeaderShadowDivider(), // Use the HeaderShadowDivider here
          const SizedBox(height: 10),

          const SizedBox(height: 16),

          /// **Payment Methods**
          Expanded(
            child: ListView(
              children: [
                ...[
                  "Debit / Credit Card",
                  "Cash",
                  "PayPal",
                  "Apple Pay",
                  "Google Pay",
                  "Netbanking"
                ].map((paymentMethod) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          print("$paymentMethod selected");
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 247, 252),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              paymentMethod,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Container(
            height: 2.5,
            decoration:
                BoxDecoration(color: Colors.grey.withOpacity(0.10), boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                offset: const Offset(3, 0),
              ),
            ]),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: CustomActionButton.greenFilled(
              text: "MAKE PAYMENT",
              onPressed: () {
                Navigator.pushNamed(context, Routes.orderplaceBSheetRoute);
                print('MAKE PAYMENT');
              },
            ),
          ),
        ],
      ),
    );
  }

  void showOrderProgressBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const OrderProgressWidget(),
    );
  }
}
