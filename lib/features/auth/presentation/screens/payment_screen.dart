import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// **Header**
          SizedBox(
            height: 110,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Center(
                child: Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 164, 104, 13),
                  ),
                ),
              ),
            ),
          ),

          /// **Divider**
          Container(
            height: 1.5,
            decoration:
                BoxDecoration(color: Colors.grey.withOpacity(0.5), boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(0, 3),
              ),
            ]),
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
                offset: const Offset(3,0),
              ),
            ]),
          ),

          /// **Bottom Button**
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                print("Make Payment Clicked!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 111, 224, 5),
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
}
