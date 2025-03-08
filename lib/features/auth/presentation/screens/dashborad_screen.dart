import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboradScreen extends StatefulWidget {
  const DashboradScreen({super.key});

  @override
  State<DashboradScreen> createState() => _DashboradScreenState();
}

class _DashboradScreenState extends State<DashboradScreen> {
  final List<Map<String, String>> foodItems = [
    {
      "image": "assets/images/image-chicken-dum-biryani.png",
      "title": "Chicken Dum Biryani",
      "subtitle": "Delicious & Spicy Biryani",
    },
    {
      "image": "assets/images/image-Chicken-Popcorn.png",
      "title": "Chicken Popcorn",
      "subtitle": "Crispy & Juicy",
    },
    {
      "image": "assets/images/image-Chicken-supreme-pizza.png",
      "title": "Chicken Supreme Pizza",
      "subtitle": "Loaded with toppings",
    },
    {
      "image": "assets/images/image-chicken-tikka-burger.png", // Fixed path
      "title": "Chicken Tikka Burger",
      "subtitle": "Juicy & Flavorful",
    },
    {
      "image": "assets/images/image-Crispy-French-Fries.png",
      "title": "Crispy French Fries",
      "subtitle": "Perfectly seasoned",
    },
    {
      "image": "assets/images/Image-veg-dum-biryani.png",
      "title": "Veg Dum Biryani",
      "subtitle": "Rich in spices & flavor",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                Icon(Icons.person_2_outlined),
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              children: [
                Text('Hey Deven'),
                Text(
                  ' Good Afternoon!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 40),

            // Popular Items Title
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular items',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 127, 78, 4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 0.75, // Adjust aspect ratio for better UI
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white, // Background color
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
                            // Background Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                foodItems[index]["image"]!,
                                width: double.infinity,
                                height: 120, // Adjust image height
                                fit: BoxFit.cover,
                              ),
                            ),
                            // SVG Icon Positioned on Top Left
                            Positioned(
                              top: 10,
                              left: 10,
                              child: SvgPicture.asset(
                                'assets/svgicons/food-category.svg',
                                width: 30,
                                height: 30,
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
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow
                                    .ellipsis, // Avoid text overflow
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
