import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/profile_details_screen/profile_details_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/widgets/apply_code_cart.dart';
import 'package:konkan_bite_food/features/auth/presentation/widgets/place_order_snackbar.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';
import 'home_screen.dart';
import 'menu_screen.dart';
import 'orders_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 3;

  /// 🛒 Cart Items with Quantity
  final List<Map<String, dynamic>> cartItems = [
    {
      "image": "assets/images/image-chicken-dum-biryani.png",
      "title": "Chicken Dum Biryani",
      "price": "₹75",
      "category": "non-veg",
      "quantity": 1,
    },
    {
      "image": "assets/images/image-Chicken-Popcorn.png",
      "title": "Chicken Popcorn",
      "price": "₹250",
      "category": "non-veg",
      "quantity": 1,
    },
    {
      "image": "assets/images/image-Chicken-supreme-pizza.png",
      "title": "Chicken Supreme Pizza",
      "price": "₹300",
      "category": "non-veg",
      "quantity": 1,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MenuScreen()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const OrdersScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const CartScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                        'Cart',
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
                          color: Color.fromARGB(255, 244, 243, 243),
                        ),
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
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
                color:
                    const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 139, 137, 137)
                        .withOpacity(0.5),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// **Scrollable Area Starts Here**
            Column(
              children: [
                /// **Delivery Address Row**
                GestureDetector(
                  onTap: () {
                    print("Address tapped!");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgicons/location_pin.svg',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Delivery Address',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text(
                                'A-205, Akshatra Apartment, Police line...',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 71, 71, 71)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.deepOrange),
                      ],
                    ),
                  ),
                ),

                /// **Divider Below Address**
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),

                /// **Title: Items in Cart**
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Items in your cart',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),

                /// **Cart Items List**
                Column(
                  children: cartItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> item = entry.value;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 15),
                      child: Card(
                        color: Colors.white,
                        margin: const EdgeInsets.only(bottom: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /// **Food Image**
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  item["image"]!,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(width: 12),

                              /// **Food Details**
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                      item["category"] == "veg"
                                          ? 'assets/svgicons/veg-category.svg'
                                          : 'assets/svgicons/non-veg-category.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item["title"]!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      item["price"]!,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),

                              buildQuantityCounter(
                                quantity: cartItems[index]["quantity"],
                                onAdd: () {
                                  setState(() {
                                    cartItems[index]["quantity"]++;
                                  });
                                },
                                onRemove: () {
                                  setState(() {
                                    if (cartItems[index]["quantity"] > 1) {
                                      cartItems[index]["quantity"]--;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
CustomActionButton(
                  isEnable: true,
                  text: 'ADD MORE ITEMS',
                  backgroundColor: const Color.fromARGB(255, 252, 243, 243),
                  textColor: Colors.deepOrange,
                  borderColor: Colors.deepOrange,
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.locationSelectionRoute);
                    print('ADD MORE ITEMS');
                  },
                ),
               

                /// **Delivery Instructions**
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svgicons/truck.svg'),
                      const SizedBox(
                          width: 8), // Optional: Space between icon and text
                      const Text(
                        'Delivery Instructions',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    minLines: 3, // Minimum 3 lines visible
                    maxLines: 10, // Maximum 10 lines allowed
                    decoration: InputDecoration(
                      hintText: "Enter your Instructions",
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(
                              255, 167, 179, 183)), // Hint text color
                      filled: true, // Enables background color
                      fillColor: const Color.fromARGB(
                          255, 230, 236, 239), // Light background color

                      // Border color same as hint text color (grey)
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.grey), // Slightly thicker on focus
                      ),
                    ),
                  ),
                ),

                /// **Discount & Promo Codes**
                const ApplyCodeWidget(),
              ],
            ),
          ],
        ),
      ),

      /// **Bottom Navigation Bar**
      bottomNavigationBar: const SizedBox(
        height: 80, // Set a fixed height
        child: PlaceOrder(),
      ),
    );
  }

  Widget buildQuantityCounter({
    required int quantity,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onRemove,
            child: const Text(
              "-",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            "$quantity",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 15),
          GestureDetector(
            onTap: onAdd,
            child: const Text(
              "+",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
