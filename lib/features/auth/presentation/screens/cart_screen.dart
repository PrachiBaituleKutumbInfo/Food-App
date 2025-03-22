import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/widgets/apply_code.dart';
import 'home_screen.dart';
import 'menu_screen.dart';
import 'orders_screen.dart';
import '../widgets/bottom_navigation.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _selectedIndex = 3;
  int quantity = 1; // Default quantity for each item

  final List<Map<String, String>> cartItems = [
    {
      "image": "assets/images/image-chicken-dum-biryani.png",
      "title": "Chicken Dum Biryani",
      "price": "₹75",
      "category": "non-veg",
    },
    {
      "image": "assets/images/image-Chicken-Popcorn.png",
      "title": "Chicken Popcorn",
      "price": "₹250",
      "category": "non-veg",
    },
    {
      "image": "assets/images/image-Chicken-supreme-pizza.png",
      "title": "Chicken Supreme Pizza",
      "price": "₹300",
      "category": "non-veg",
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
                  'Cart',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 164, 104, 13)),
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
                  offset: const Offset(0, 3)),
            ]),
          ),

          const SizedBox(height: 10),

          /// **Scrollable Area Starts Here**
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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

                  /// **Cart Items List (Without ScrollView)**
                  Column(
                    children: cartItems.map((item) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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

                                /// **Quantity Selector**
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove,
                                            color: Colors.green),
                                        onPressed: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity--;
                                            });
                                          }
                                        },
                                      ),
                                      Text(
                                        "$quantity",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add,
                                            color: Colors.green),
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  /// **Add More Items Button (Expanded Width)**
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: SizedBox(
                      width: double.infinity, // Expand button to full width
                      child: ElevatedButton(
                        onPressed: () {
                          print("Add More Items Pressed!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 241, 239, 238),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'ADD MORE ITEMS',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// **Delivery Instructions**
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: TextField(
                      minLines: 3, // Minimum 3 lines visible
                      maxLines: 10, // Maximum 10 lines allowed
                      decoration: InputDecoration(
                        hintText: "Enter your Instructions",
                        hintStyle: const TextStyle(
                            color: Colors.grey), // Hint text color
                        filled: true, // Enables background color
                        fillColor:
                            Colors.blueGrey.shade50, // Light background color

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

                  const ApplyCodeWidget(), // Calling the widget here
                ],
              ),
            ),
          ),
        ],
      ),

      /// **Bottom Navigation Bar**
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
