import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

// Step Enum for order status
enum OrderStatus {
  accepted,
  cooking,
  onTheWay,
  delivered,
}

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  OrderStatus currentStatus = OrderStatus.cooking;

  final List<Map<String, dynamic>> steps = [
    {'label': 'Accepted', 'status': OrderStatus.accepted},
    {'label': 'Cooking', 'status': OrderStatus.cooking},
    {'label': 'On the Way', 'status': OrderStatus.onTheWay},
    {'label': 'Delivered', 'status': OrderStatus.delivered},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map Placeholder
          SizedBox.expand(
            child: Image.asset('assets/map.png', fit: BoxFit.cover),
          ),

          // Back Button
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // Bottom Sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Order is Preparing",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Arriving at ", style: TextStyle(fontSize: 14)),
                      Text("4:35 PM",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text("OTP - ", style: TextStyle(fontSize: 14)),
                      Text("7548",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 👇 Replacing with custom horizontal strip-style progress
                  _buildStepStriper(),

                  const SizedBox(height: 30),

                  // Help section
                  Row(
                    children: [
                      const Text(
                        "Need any help?",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.call, size: 18),
                        label: const Text("CALL"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          textStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Cancel Link
                  const Row(
                    children: [
                      Text("Want to ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 114, 113, 113))),
                      Text(
                        "Cancel order?",
                        style: TextStyle(
                          color: AppColors.darkText,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationThickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 👉 Custom Striper Function
  Widget _buildStepStriper() {
    return Row(
      children: List.generate(steps.length * 2 - 1, (index) {
        if (index.isOdd) {
          // Connector line between steps
          int leftStep = index ~/ 2;
          bool isActiveLine = currentStatus.index > leftStep;
          return Expanded(
            child: Container(
              height: 2,
              color: isActiveLine ? AppColors.primary : Colors.grey.shade300,
            ),
          );
        } else {
          int stepIndex = index ~/ 2;
          OrderStatus stepStatus = steps[stepIndex]['status'];
          bool isCompleted = currentStatus.index > stepStatus.index;
          bool isCurrent = currentStatus == stepStatus;

          return Column(
            children: [
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCompleted
                      ? AppColors.primary
                      : isCurrent
                          ? AppColors.white
                          : AppColors.primary,
                  // width: isSelected ? 6.5 : 2,
                  border: Border.all(
                    color: isCompleted || isCurrent
                        ? AppColors.primary
                        : AppColors.primary,
                    width: 2,
                  ),
                ),
                child: isCompleted
                    ? Icon(Icons.check, color: Colors.white, size: 18)
                    : const SizedBox.shrink(),
              ),
              const SizedBox(height: 6),
              Text(
                steps[stepIndex]['label'],
                style: const TextStyle(
                  fontSize: 12,
                  // fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                  // color: isCurrent ? AppColors.primary : Colors.black,
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
