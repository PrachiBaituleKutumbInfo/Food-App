import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/widgets/custom_footer_divider.dart';
import 'package:konkan_bite_food/widgets/custom_header_divider.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  CustomBottomNavBarState createState() => CustomBottomNavBarState();
}

class CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FooterShadowDivider(), // Add this line
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                spreadRadius: 3,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: widget.currentIndex,
            onTap: widget.onTap,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            items: [
              _buildNavItem('assets/svgicons/home.svg', 'Home', 0),
              _buildNavItem('assets/svgicons/fork-spoon.svg', 'Menu', 1),
              _buildNavItem('assets/svgicons/orders.svg', 'Orders', 2),
              _buildNavItem('assets/svgicons/cart.svg', 'Cart', 3),
            ],
          ),
        ),
      ],
    );
  }

  /// Function to build BottomNavigationBarItem with a container for icon & label styling
  BottomNavigationBarItem _buildNavItem(
      String iconPath, String label, int index) {
    bool isSelected = widget.currentIndex == index;

    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 6, horizontal: 12), // Space around icon & text
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors
                    .peachBackground // Light orange background for selected item
                : Colors.transparent, // No background for unselected items
            borderRadius: BorderRadius.circular(10),
            // Rounded container effect
          ),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                  isSelected ? AppColors.primary : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 2), // Space between icon and text
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primary : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      label: '',
    );
  }
}
