import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/home_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_details_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/orders_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/widgets/bottom_navigation.dart';
import 'package:konkan_bite_food/features/auth/presentation/widgets/item_added_bottom_bar.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
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

  int _selectedIndex = 1;

  String selectedCategory = "veg"; // ✅ Matching category names exactly

  final List<Map<String, String>> menuItems = [
    {
      "image": "assets/images/image-chicken-dum-biryani.png",
      "title": "Chicken Dum Biryani",
      "price": "₹75",
      "category": "non-veg",
      "rating": "4.5",
      "reviews": "25",
      "description":
          "Aromatic basmati rice cooked with succulent chicken pieces, infused with traditional spices and slow-cooked to perfection."
    },
    {
      "image": "assets/images/image-Chicken-Popcorn.png",
      "title": "Chicken Popcorn",
      "price": "₹250",
      "category": "non-veg",
      "rating": "4.2",
      "reviews": "18",
      "description":
          "Crispy, bite-sized chicken pieces, coated with flavorful seasoning and deep-fried to golden perfection."
    },
    {
      "image": "assets/images/image-Chicken-supreme-pizza.png",
      "title": "Chicken Supreme Pizza",
      "price": "₹300",
      "category": "non-veg",
      "rating": "4.8",
      "reviews": "30",
      "description":
          "A delicious pizza loaded with spicy chicken chunks, fresh vegetables, and a generous layer of mozzarella cheese."
    },
    {
      "image": "assets/images/image-chicken-tikka-burger.png",
      "title": "Chicken Tikka Burger",
      "price": "₹200",
      "category": "non-veg",
      "rating": "4.6",
      "reviews": "22",
      "description":
          "Grilled chicken tikka patty topped with fresh lettuce, onions, and special sauces, served in a soft bun."
    },
    {
      "image": "assets/images/image-Crispy-French-Fries.png",
      "title": "Crispy French Fries",
      "price": "₹99",
      "category": "veg",
      "rating": "4.7",
      "reviews": "28",
      "description":
          "Golden, crispy, and perfectly seasoned French fries, served hot and fresh."
    },
    {
      "image": "assets/images/Image-veg-dum-biryani.png",
      "title": "Veg Dum Biryani",
      "price": "₹199",
      "category": "veg",
      "rating": "4.3",
      "reviews": "19",
      "description":
          "A flavorful mix of basmati rice, fresh vegetables, and aromatic spices, slow-cooked for a rich taste."
    },
    {
      "image": "assets/images/image-Paneer-tikka-Burger.png",
      "title": "Paneer Tikka Burger",
      "price": "₹49",
      "category": "veg",
      "rating": "2.9",
      "reviews": "11",
      "description":
          "Grilled paneer tikka patty with tangy sauces, fresh lettuce, and onions, served in a soft bun."
    },
    {
      "image": "assets/images/Image-Peri-Peri-Chicken-Pizza.png",
      "title": "Peri Peri Chicken Pizza",
      "price": "₹249",
      "category": "non-veg",
      "rating": "3.4",
      "reviews": "3",
      "description":
          "A spicy and flavorful pizza topped with juicy peri-peri chicken, cheese, and zesty peri-peri sauce."
    },
    {
      "image": "assets/images/image-Chicken-Pepperoni-Pizza.png",
      "title": "Chicken Pepperoni Pizza",
      "price": "₹201",
      "category": "non-veg",
      "rating": "4",
      "reviews": "6",
      "description":
          "A delicious pizza loaded with spicy chicken pepperoni slices, cheese, and a rich tomato sauce."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 110,
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Center(
                child: Text(
                  'All Menus',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 164, 104, 13),
                  ),
                ),
              ),
            ),
          ),

          /// **Blurred Divider (Only Downward)**
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

          /// **Category Selection**
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildCategoryChip("non-veg", "Non-Veg"),
                const SizedBox(width: 10),
                _buildCategoryChip("veg", "Veg"),
                const SizedBox(width: 10),
                _buildCategoryChip("bestseller", "Bestseller"),
              ],
            ),
          ),

          /// **Menu List**
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: menuItems
                  .where((item) {
                    if (selectedCategory == "bestseller") {
                      return double.parse(item["rating"]!) >=
                          4.5; // Bestseller if rating ≥ 4.5
                    }
                    return item["category"] == selectedCategory;
                  })
                  .map((item) => _buildMenuItem(item))
                  .toList(),
            ),
          ),
           Container(
            height: 1,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 139, 137, 137).withOpacity(0.5),
            ),
           )
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMenuItem(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20), // Space between items
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// *Food Image with "Add +" Button inside a Stack*
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item["image"]!,
                  width: 160,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),

              /// *"Add +" Button Positioned 10px from Bottom*
              Positioned(
                bottom: -40, // ✅ Moves the button slightly over the image
                left: 25, // Adjust left spacing
                right: 25, // Adjust right spacing
                child: ElevatedButton(
                  onPressed: () {
                    ItemAddedBottomBar.show(context);
                  },
                  //
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(
                        color:
                            Color.fromARGB(255, 229, 228, 228), // Grey border
                        width: 1.5,
                      ),
                    ),
                    elevation: 4, // Button shadow
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Add +",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 12),

          /// *Food Details*
          Expanded(
            child: GestureDetector(
              onTap: () {
                MenuDetailsBottomSheet.show(context, item); // Call bottom sheet
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    item["category"] == "veg"
                        ? 'assets/svgicons/veg-category.svg'
                        : 'assets/svgicons/non-veg-category.svg',
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    item["title"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  /// *Rating & Reviews*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item["price"]!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 18),
                          const SizedBox(width: 4),
                          Text(
                            "${item["rating"]} ",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "(${item["reviews"]})",
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "${item["description"]} ",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String categoryKey, String categoryLabel) {
    bool isSelected = selectedCategory == categoryKey;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = categoryKey;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 253, 228, 217)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.deepOrange
                : const Color.fromARGB(255, 212, 223, 223),
            width: 2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              categoryLabel,
              style: TextStyle(
                color: isSelected
                    ? Colors.deepOrange
                    : const Color.fromARGB(255, 104, 103, 103),
                fontWeight: FontWeight.bold,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategory = ''; // Deselect when 'X' is clicked
                  });
                },
                child:
                    const Icon(Icons.close, size: 18, color: Colors.deepOrange),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
