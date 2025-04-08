import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/orders_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _updateQuantity(int index, int change) {
    setState(() {
      foodItems[index]["quantity"] += change;

      // Ensure quantity does not go below 0
      if (foodItems[index]["quantity"] < 0) {
        foodItems[index]["quantity"] = 0;
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different screens
    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              /// *Delivery Address Section*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DELIVER TO',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(width: 5),
                          Text('- A-205, Akshatra Apart...',
                              style: TextStyle(fontSize: 14)),
                          Icon(Icons.arrow_drop_down_sharp),
                        ],
                      ),
                    ],
                  ),
                  SvgPicture.asset('assets/svgicons/profile-icon.svg'),
                ],
              ),

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

              const SizedBox(height: 30),

              /// *Popular Items Title*
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular items',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 164, 104, 13),
                  ),
                ),
              ),

              GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // Disables scrolling
                shrinkWrap: true, // Allows it to fit within its container
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.80, // Adjusted for better layout
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                foodItems[index]["image"]!,
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: SvgPicture.asset(
                                foodItems[index]["category"] == "veg"
                                    ? 'assets/svgicons/veg-category.svg'
                                    : 'assets/svgicons/non-veg-category.svg',
                                width: 25,
                                height: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodItems[index]["title"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                // maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                foodItems[index]["subtitle"]!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 116, 142, 164),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    foodItems[index]["price"]!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  foodItems[index]["quantity"] == 0
                                      ? SizedBox(
                                           width: 110,
                                          height: 40,
                                          child: ElevatedButton(
                                            onPressed: () =>
                                                _updateQuantity(index, 1),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                side: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.5,
                                                ),
                                              ),
                                              elevation: 4,
                                            ),
                                            child: const Text(
                                              " Add + ",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: SizedBox(
                                            height: 40,
                                            
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.remove,
                                                      color: Colors.green,
                                                      size: 16),
                                                  onPressed: () =>
                                                      _updateQuantity(
                                                          index, -1),
                                                ),
                                                Text(
                                                  "${foodItems[index]["quantity"]}",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add,
                                                      color: Colors.green,
                                                      size: 16),
                                                  onPressed: () =>
                                                      _updateQuantity(index, 1),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
