import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/dashboard_screen/dashboard_home_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/cart_screen/cart_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_screen/food_category_filter.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_screen/menu_details_screen.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_screen/menu_floating_button.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/menu_screen/menu_item_card.dart';
import 'package:konkan_bite_food/features/auth/presentation/screens/order_history_screen/order_history_screen.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/bottom_navigation.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_title.dart';
import 'package:konkan_bite_food/widgets/quanity_counter_button.dart';

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
            MaterialPageRoute(builder: (context) => const OrderHistoryScreen()));
        break;
      case 3:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const CartScreen()));
        break;
    }
  }
 
   final ValueNotifier<bool> _isSheetOpen = ValueNotifier(false);

  void _toggleMenuSheet() {
    if (_isSheetOpen.value) {
      Navigator.pop(context);
      _isSheetOpen.value = false;
    } else {
      _isSheetOpen.value = true;
      CornerMenuBottomSheet.show(context).whenComplete(() {
        _isSheetOpen.value = false;
      });
    }
  }

  @override
  void dispose() {
    _isSheetOpen.dispose();
    super.dispose();
  }

  int _selectedIndex = 1;
  Set<String> selectedCategories = {"veg"};
  Map<String, int> itemQuantities = {};

  int getQuantity(Map<String, String> item) =>
      itemQuantities[item["title"]] ?? 0;

  void increaseQuantity(Map<String, String> item) {
    setState(() {
      final title = item["title"];
      itemQuantities[title!] = (itemQuantities[title] ?? 0) + 1;
    });
  }

  void decreaseQuantity(Map<String, String> item) {
    setState(() {
      final title = item["title"];
      final current = itemQuantities[title] ?? 0;
      if (current > 0) {
        itemQuantities[title!] = current - 1;
      }
    });
  }

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
      backgroundColor: AppColors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 10, left: 5),
            child: Row(
              children: [
                /// Centered title
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: HeaderTitle(
                      title: 'All Menus',
                    ),
                  ),
                ),
              ],
            ),
          ),
          const HeaderShadowDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Wrap(
              spacing: 10,
              children: [
                CategoryChip(
                  categoryKey: "non-veg",
                  categoryLabel: "Non-Veg",
                  isSelected: selectedCategories.contains("non-veg"),
                  selectedCount: selectedCategories.length,
                  onSelect: () {
                    setState(() {
                      if (selectedCategories.contains("non-veg")) {
                        if (selectedCategories.length > 1) {
                          selectedCategories.remove("non-veg");
                        }
                      } else {
                        selectedCategories.add("non-veg");
                      }
                    });
                  },
                  onRemove: () {
                    setState(() {
                      selectedCategories.remove("non-veg");
                    });
                  },
                ),
                CategoryChip(
                  categoryKey: "veg",
                  categoryLabel: "Veg",
                  isSelected: selectedCategories.contains("veg"),
                  selectedCount: selectedCategories.length,
                  onSelect: () {
                    setState(() {
                      if (selectedCategories.contains("veg")) {
                        if (selectedCategories.length > 1) {
                          selectedCategories.remove("veg");
                        }
                      } else {
                        selectedCategories.add("veg");
                      }
                    });
                  },
                  onRemove: () {
                    setState(() {
                      selectedCategories.remove("veg");
                    });
                  },
                ),
                CategoryChip(
                  categoryKey: "bestseller",
                  categoryLabel: "Bestseller",
                  isSelected: selectedCategories.contains("bestseller"),
                  selectedCount: selectedCategories.length,
                  onSelect: () {
                    setState(() {
                      if (selectedCategories.contains("bestseller")) {
                        if (selectedCategories.length > 1) {
                          selectedCategories.remove("bestseller");
                        }
                      } else {
                        selectedCategories.add("bestseller");
                      }
                    });
                  },
                  onRemove: () {
                    setState(() {
                      selectedCategories.remove("bestseller");
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: menuItems.where((item) {
                bool isBestseller = selectedCategories.contains("bestseller") &&
                    double.parse(item["rating"]!) >= 4.5;

                bool isCategorySelected =
                    selectedCategories.contains(item["category"]);

                return isBestseller || isCategorySelected;
              }).length,
              itemBuilder: (context, index) {
                final filteredItems = menuItems.where((item) {
                  bool isBestseller =
                      selectedCategories.contains("bestseller") &&
                          double.parse(item["rating"]!) >= 4.5;

                  bool isCategorySelected =
                      selectedCategories.contains(item["category"]);

                  return isBestseller || isCategorySelected;
                }).toList();

                final item = filteredItems[index];

                return MenuItemCard(
                  item: item,
                  quantity: getQuantity(item),
                  onAdd: () => increaseQuantity(item),
                  onRemove: () => decreaseQuantity(item),
                  onTap: () => MenuDetailsBottomSheet.show(context, item),
                  quantityWidget: QuantityCounterWidget(
                    quantity: getQuantity(item),
                    onAdd: () => increaseQuantity(item),
                    onRemove: () => decreaseQuantity(item),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.greyText,
                thickness: 0.5,
                height: 25
              ),
            ),
          ),
        ],
      ),
       floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _isSheetOpen,
        builder: (context, isOpen, _) {
          return FloatingActionButton.extended(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            onPressed: _toggleMenuSheet,
            icon: isOpen
                ? const Icon(Icons.close)
                : SvgPicture.asset(
                    'assets/svgicons/Menu-icon.svg',
                    color: AppColors.white,
                  ),
            label: Text(isOpen ? "Close" : "Menu"),
          );
        },
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
