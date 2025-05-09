import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/dashboard_screen/widgets/deliver_to.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/dashboard_screen/widgets/food_item_card.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/dashboard_screen/widgets/section_title.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_screen/menu_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/orders_screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/bottom_navigation.dart';

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({super.key});

  @override
  State<DashboardHomeScreen> createState() => DashboardHomeScreenState();
}

class DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> foodItems = [
    {
      "image": "assets/images/image-chicken-dum-biryani.png",
      "title": "Chicken Dum Biryani",
      "subtitle": "Delicious & Spicy Biryani",
      "price": "₹175",
      "category": "non-veg",
      "quantity": 0
    },
    {
      "image": "assets/images/image-Chicken-Popcorn.png",
      "title": "Chicken Popcorn",
      "subtitle": "Crispy & Juicy",
      "price": "₹250",
      "category": "non-veg",
      "quantity": 0
    },
    {
      "image": "assets/images/image-Chicken-supreme-pizza.png",
      "title": "Chicken Supreme Pizza",
      "subtitle": "Loaded with toppings",
      "price": "₹300",
      "category": "non-veg",
      "quantity": 0
    },
    {
      "image": "assets/images/image-chicken-tikka-burger.png",
      "title": "Chicken Tikka Burger",
      "subtitle": "Juicy & Flavorful",
      "price": "₹200",
      "category": "non-veg",
      "quantity": 0
    },
    {
      "image": "assets/images/image-Crispy-French-Fries.png",
      "title": "Crispy French Fries",
      "subtitle": "Perfectly seasoned",
      "price": "₹99",
      "category": "veg",
      "quantity": 0
    },
    {
      "image": "assets/images/Image-veg-dum-biryani.png",
      "title": "Veg Dum Biryani",
      "subtitle": "Rich in spices & flavor",
      "price": "₹199",
      "category": "non-veg",
      "quantity": 0
    },
  ];

  final List<Map<String, dynamic>> cartItems = [];

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const DashboardHomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const MenuScreen()));
        break;
      case 2:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OrdersScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CartScreen()));
        break;
    }
  }

  void _addToCart(int index) {
    setState(() {
      final foodItem = foodItems[index];
      final existingCartItem = cartItems.firstWhere(
          (item) => item["title"] == foodItem["title"],
          orElse: () => {} // Return an empty map as the default value
          );

      if (existingCartItem.isNotEmpty) {
        existingCartItem["quantity"]++;
      } else {
        cartItems.add({
          ...foodItem,
          "quantity": 1,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// *Delivery Address Section*
              const DeliveryAddressSection(),

              const SizedBox(height: 30),

              /// *Greeting Section*
              const Row(
                children: [
                  Text('Hey Deven,'),
                  Text(
                    ' Good Afternoon!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// *Banner Image*
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Image.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const SectionTitle(title: 'Popular'),

              GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Disables scrolling
                shrinkWrap: true, // Allows it to fit within its container
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.80, // Adjusted for better layout
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return FoodItemCard(
                    image: foodItems[index]["image"],
                    title: foodItems[index]["title"],
                    subtitle: foodItems[index]["subtitle"],
                    price: foodItems[index]["price"],
                    category: foodItems[index]["category"],
                    quantity: foodItems[index]["quantity"],
                    onAdd: () {
                      setState(() {
                        foodItems[index]["quantity"]++;

                        final existingIndex = cartItems.indexWhere((item) =>
                            item["title"] == foodItems[index]["title"]);

                        if (existingIndex != -1) {
                          cartItems[existingIndex]["quantity"]++;
                        } else {
                          cartItems.add({...foodItems[index], "quantity": 1});
                        }
                      });
                    },
                    onRemove: () {
                      setState(() {
                        if (foodItems[index]["quantity"] > 0) {
                          foodItems[index]["quantity"]--;

                          final existingIndex = cartItems.indexWhere((item) =>
                              item["title"] == foodItems[index]["title"]);

                          if (existingIndex != -1) {
                            cartItems[existingIndex]["quantity"]--;

                            if (cartItems[existingIndex]["quantity"] <= 0) {
                              cartItems.removeAt(existingIndex);
                            }
                          }
                        }
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),

      /// **Bottom Navigation Bar**
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
