import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class QuantityCounterWidget extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final Color color;
  final Color borderColor;
  final double fontSize;

  const QuantityCounterWidget({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    this.color = Colors.green,
    this.borderColor = Colors.grey,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // 👈 Fixed width
      height: 45, // 👈 Fixed height
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.steelBlue,
            blurRadius: 10,
            offset: Offset(1.5, 2),
          ),
        ],
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: quantity < 1
          ? GestureDetector(
              onTap: onAdd,
              child: Text(
                "Add +",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onRemove,
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontSize: fontSize + 2,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  "$quantity",
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onAdd,
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontSize: fontSize + 2,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
