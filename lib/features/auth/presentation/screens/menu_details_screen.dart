import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDetailsBottomSheet {
  static void show(BuildContext context, Map<String, String> item) {
    int quantity = 1; // Initial quantity

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag Indicator
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // **Expanded Image**
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      item["image"]!,
                      width: double.infinity, // Full width
                      height: 200, // Adjust height
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // **Row: Food Category Icon & Star Rating**
                  Row(
                    children: [
                      // Food Category Icon (Veg/Non-Veg)
                      SvgPicture.asset(
                        item["category"] == "veg"
                            ? 'assets/svgicons/veg-category.svg'
                            : 'assets/svgicons/non-veg-category.svg',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 5),

                      // Star Rating
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: index < double.parse(item["rating"]!)
                                ? Colors.orange
                                : Colors.grey[300],
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),

                      // Ratings Count
                      Text(
                        "(${item["reviews"]} Ratings)",
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // **Title**
                  Text(
                    item["title"]!,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // **Extra Add-ons Box**
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Extra Add-on",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),

                        _buildExtraItem("Extra Cheese", "₹50"),
                        _buildExtraItem("Extra Chicken", "₹99"),
                        _buildExtraItem("Gulab Jamun (Pack of 1)", "₹79"),
                        _buildExtraItem("Roti (Pack of 2)", "₹49"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // **Quantity Selector & Add to Cart**
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Quantity Selector
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.green),
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
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.green),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      // Add to Cart Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        ),
                        child: Text(
                        "ADD ITEM - ₹${int.parse(item["price"]!.replaceAll('₹', '')) * quantity}",

                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // **Description**
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item["description"]!,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // **Helper Widget for Extra Items**
  static Widget _buildExtraItem(String name, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Item Name
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),

          // Price & Checkbox
          Row(
            children: [
              Text(price.replaceAll('₹', ''), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),

              const SizedBox(width: 10),
              Checkbox(value: false, onChanged: (bool? value) {}),
            ],
          ),
        ],
      ),
    );
  }
}
