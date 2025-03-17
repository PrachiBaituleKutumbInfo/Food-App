import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDetailsBottomSheet {
  static void show(BuildContext context, Map<String, String> item) {
    int quantity = 1; // Initial quantity
    Map<String, bool> extraItems = {
      "Extra Cheese": false,
      "Extra Chicken": false,
      "Gulab Jamun (Pack of 1)": false,
      "Roti (Pack of 2)": false,
    };

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows full-screen height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return DraggableScrollableSheet(
              initialChildSize: 1.0, // Fully expanded
              minChildSize: 1.0, // Prevent dragging down
              maxChildSize: 1.0, // Keep it fully expanded
              builder: (context, scrollController) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
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

                        // *Expanded Image*
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

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // *Row: Food Category Icon & Star Rating*
                            Row(
                              children: [
                                SvgPicture.asset(
                                  item["category"] == "veg"
                                      ? 'assets/svgicons/veg-category.svg'
                                      : 'assets/svgicons/non-veg-category.svg',
                                  width: 25,
                                  height: 25,
                                ),
                                const SizedBox(width: 5),
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
                                Text(
                                  "(${item["reviews"]} Ratings)",
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item["title"]!,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
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
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  ...extraItems.keys
                                      .map((extra) => _buildExtraItem(
                                          extra, "₹50", extraItems, setState))
                                      .toList(),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item["description"]!,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Bottom Section with Border
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Colors.grey, width: 1), // Top border
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 10), // Space between border and content
                          child: Row(
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

                              // Add Item Button
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 12),
                                ),
                                child: Text(
                                  "ADD ITEM - ₹${int.parse(item["price"]!.replaceAll('₹', '')) * quantity}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  static Widget _buildExtraItem(String name, String price,
      Map<String, bool> extraItems, Function setState) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontSize: 16)),
          Row(
            children: [
              Text(price.replaceAll('₹', ''),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Checkbox(
                value: extraItems[name],
                onChanged: (bool? value) {
                  setState(() {
                    extraItems[name] = value!;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                side: const BorderSide(color: Colors.deepOrange, width: 2),
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.deepOrange;
                    }
                    return Colors.transparent;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
