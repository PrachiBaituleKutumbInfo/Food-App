import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_place_BSheet.dart';

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
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: SizedBox(
              height: 50,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 164, 104, 13),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFE0E0E0), // light grey background
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// **Divider**
          Container(
            height: 1.5,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
          ),

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

          /// **Bottom Button**
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                showOrderProgressBottomSheet(context);
                print("Make Payment Clicked!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 75, 200, 77),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Center(
                child: Text(
                  "MAKE PAYMENT",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
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
