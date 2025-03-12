import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String selectedCategory = "veg"; // ✅ Matching category names exactly

  final List<Map<String, String>> menuItems = [
    {
      "image": "assets/images/image-chicken-dum-biryani.png",
      "title": "Chicken Dum Biryani",
      "price": "₹75",
      "category": "non-veg",
      "rating": "4.5",
      "reviews": "25",
      "description": ""
    },
    {
      "image": "assets/images/image-Chicken-Popcorn.png",
      "title": "Chicken Popcorn",
      "price": "₹250",
      "category": "non-veg",
      "rating": "4.2",
      "reviews": "18",
      "description": ""
    },
    {
      "image": "assets/images/image-Chicken-supreme-pizza.png",
      "title": "Chicken Supreme Pizza",
      "price": "₹300",
      "category": "non-veg",
      "rating": "4.8",
      "reviews": "30",
      "description": ""
    },
    {
      "image": "assets/images/image-chicken-tikka-burger.png",
      "title": "Chicken Tikka Burger",
      "price": "₹200",
      "category": "non-veg",
      "rating": "4.6",
      "reviews": "22",
      "description": ""
    },
    {
      "image": "assets/images/image-Crispy-French-Fries.png",
      "title": "Crispy French Fries",
      "price": "₹99",
      "category": "veg",
      "rating": "4.7",
      "reviews": "28",
      "description": ""
    },
    {
      "image": "assets/images/Image-veg-dum-biryani.png",
      "title": "Veg Dum Biryani",
      "price": "₹199",
      "category": "veg",
      "rating": "4.3",
      "reviews": "19",
      "description": ""
    },
    {
      "image": "assets/images/image-Paneer-tikka-Burger.png",
      "title": "Paneer Tikka Burger",
      "price": "₹49",
      "category": "veg",
      "rating": "2.9",
      "reviews": "11",
      "description": ""
    },
    {
      "image": "assets/images/Image-Peri-Peri-Chicken-Pizza.png",
      "title": "Peri Peri Chicken Pizza",
      "price": "₹249",
      "category": "non-veg",
      "rating": "3.4",
      "reviews": "3",
      "description": ""
    },
    {
      "image": "assets/images/image-Chicken-Pepperoni-Pizza.png",
      "title": "Chicken Pepperoni Pizza",
      "price": "₹201",
      "category": "non-veg",
      "rating": "4",
      "reviews": "6",
      "description": ""
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
                  .where((item) => item["category"] == selectedCategory)
                  .map((item) => _buildMenuItem(item))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(Map<String, String> item) {
    return Stack(
      clipBehavior: Clip.none, // Allows overflow
      children: [
        Row(
          children: [
            /// **Food Image with Stack**
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item["image"]!,
                width: 120,
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

                  /// **Rating & Reviews**
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
                ],
              ),
            ),
          ],
        ),

        /// **"Add +" Button (Positioned Below Image)**
        Positioned(
          bottom: -30, // Moves button slightly below image
          // Adjust left padding
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Color.fromARGB(255, 229, 228, 228), // Grey border
                  width: 1.5,
                ),
              ),
              elevation: 4, // Add button shadow
            ),
            child: const Text(
              "Add +",
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 253, 228, 217)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: isSelected
                  ? Colors.deepOrange
                  : const Color.fromARGB(255, 212, 223, 223),
              width: 3),
        ),
        child: Text(
          categoryLabel,
          style: TextStyle(
            color: isSelected ? Colors.deepOrange : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
