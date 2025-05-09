import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/address_detail_screen/address_details_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/widgets/apply_code_cart.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/place_order_snackbar.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/widgets/bill_details_info.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/widgets/cart_text_field_widgets.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/circular_back_button.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';
import 'package:konkan_bite_food/widgets/custom_footer_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';
import 'package:konkan_bite_food/widgets/quanity_counter_button.dart';
import '../dashboard_screen/dashboard_home_screen.dart';
import '../menu_screen/menu_screen.dart';
import '../orders_screen.dart';

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
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const DashboardHomeScreen()));
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
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 5),
              child: Row(
                children: [
                  /// Back button on the left
                  CircularBackButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardHomeScreen(),
                      ),
                    ),
                  ),

                  /// Centered title
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: HeaderTitle(
                        title: 'Cart',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const HeaderShadowDivider(), // Use the HeaderShadowDivider here
            const SizedBox(height: 10),

            /// **Scrollable Area Starts Here**
            Column(
              children: [
                /// **Delivery Address Row**
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddressDetailsScreen()),
                    );
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
                            size: 20, color: AppColors.primary),
                      ],
                    ),
                  ),
                ),

                /// **Divider Below Address**
                Container(
                  height: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
              const  SizedBox(
                  height: 20,
                ),

                /// **Title: Items in Cart**
                const IconHeadingRow(
                  heading: 'Items in your cart',
                ),
              const  SizedBox(
                  height: 20,
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

                              QuantityCounterWidget(
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

                /// Add more items
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: CustomActionButton.orangeBorderWithIcon(
                    text: "ADD MORE ITEMS",
                    icon: const Icon(Icons.edit, color: Colors.transparent),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.locationSelectionRoute);

                      print("ADD MORE ITEMS");
                    },
                  ),
                ),

                /// **Delivery Instructions**
                const IconHeadingRow(
                  iconAssetPath: 'assets/svgicons/truck.svg',
                  heading: 'Delivery Instructions',
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: CardTextField(
                    hintText: "Enter your Instructions",
                    isMultiline: true,
                  ),
                ),

                const SizedBox(height: 10),
                const IconHeadingRow(
                  iconAssetPath: 'assets/svgicons/tag.svg',
                  heading: 'Discount & Promo Codes',
                ),
                const SizedBox(height: 10),

                /// **Apply Code**
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 50,
                    // margin: const EdgeInsets.only(right: 0),
                    child: CardTextField(
                      hintText: "Type Coupon Code",
                      isMultiline: false,
                      buttonText: "APPLY",
                      onButtonPressed: () {
                        print("Apply Code Pressed!");
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const IconHeadingRow(
                  iconAssetPath: 'assets/svgicons/Bill.svg',
                  heading: 'Bill Details',
                ),
                const SizedBox(height: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BillRow(title: "Subtotal", value: "₹210"),
                    BillRow(title: "Discount", value: "-₹50", isNegative: true),
                    BillRow(title: "Delivery Fee", value: "₹25"),
                    BillRow(title: "Tax & Other Fees", value: "₹10"),
                    BillRow(title: "Platform Fees", value: "₹5"),
                    SizedBox(height: 10),
                    Divider(thickness: 1),
                    BillRow(title: "To Pay", value: "₹420", isBold: true),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
            const FooterShadowDivider(),
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
}
