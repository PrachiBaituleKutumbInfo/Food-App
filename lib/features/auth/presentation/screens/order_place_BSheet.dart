import 'package:flutter/material.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class OrderProgressWidget extends StatefulWidget {
  const OrderProgressWidget({super.key});

  @override
  State<OrderProgressWidget> createState() => _OrderProgressWidgetState();
}

class _OrderProgressWidgetState extends State<OrderProgressWidget> {
  int step = 0;

  @override
  void initState() {
    super.initState();
    startProgressFlow();
  }

  void startProgressFlow() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() => step = 1);

    await Future.delayed(const Duration(seconds: 1));
    setState(() => step = 2);

    await Future.delayed(const Duration(seconds: 2));
    setState(() => step = 3);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
    // AssetImage('assets/map.png'),
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
      child: Image.asset(
        'assets/map.png',
        fit: BoxFit.cover,
      ),
    ),
        Container(
          height: screenHeight * 0.65,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            children: [
              // MAIN CONTENT
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (step == 0 || step == 1)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Placing your order',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: LinearProgressIndicator(
                                    value: step == 0 ? 0.2 : 1.0,
                                    minHeight: 10,
                                    backgroundColor: Colors.grey.shade300,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            Colors.green),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (step == 2 || step == 3)
                        Column(
                          children: [
                            step == 2
                                ? const CircularProgressIndicator()
                                : const Icon(Icons.check_circle,
                                    size: 60, color: Colors.green),
                            const SizedBox(height: 20),
                            Text(
                              'Order Placed',
                              style: AppTextStyle.largeTitleRegular
                                  .copyWith(color: AppColors.navyBlack),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Order ID:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              ' #123456789',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 112, 107, 107)),
                            ),
                            const SizedBox(height: 15),
                            const Text.rich(
                              TextSpan(
                                text: 'Delivery OTP - ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: '7548',
                                    style: TextStyle(color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              'Share this with the delivery person',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 112, 107, 107)),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),

              // TRACK ORDER BUTTON at bottom
              if (step == 3) ...[
                const SizedBox(height: 20),
                CustomActionButton.orangeBorderWithIcon(
                  text: "TRACK ORDER",
                  icon: Icon(Icons.edit, color: Colors.transparent),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.orderTrackingRoute);

                    print("TRACK ORDER");
                  },
                ),
              ],
            ],
          ),
        ),

        // Floating Close Button
        Positioned(
          top: -50,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
