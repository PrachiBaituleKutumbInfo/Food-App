import 'package:flutter/material.dart';
import 'package:konkan_bite_food/core/config/routes.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';
import 'package:konkan_bite_food/features/auth/theme/themeText.dart';
import 'package:konkan_bite_food/widgets/custom_button.dart';

class OrderProgressWidget extends StatefulWidget {
  const OrderProgressWidget({Key? key}) : super(key: key);

  @override
  State<OrderProgressWidget> createState() => _OrderProgressWidgetState();
}

class _OrderProgressWidgetState extends State<OrderProgressWidget>
    with SingleTickerProviderStateMixin {
  int step = 0;

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
    startProgressFlow();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      clipBehavior: Clip.none,
      children: [
        // Background map
        Positioned.fill(
          child: Image.asset(
            'assets/map.png',
            fit: BoxFit.cover,
          ),
        ),

        // Fixed Height Bottom Sheet (65% of screen)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SlideTransition(
            position: _slideAnimation,
            child: SizedBox(
              height: screenHeight * 0.65,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (step == 0 || step == 1)
                                Column(
                                  children: [
                                    Text('Placing your order',
                                        style: AppTextStyle.loginTitleMedium),
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
                                          AppColors.successDark,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ],
                                ),
                              if (step == 2 || step == 3)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                               
                                  children: [
                                    step == 2
                                        ? const CircularProgressIndicator()
                                        : const Icon(Icons.check_circle,
                                            size: 70, color: Colors.green),
                                    const SizedBox(height: 30),
                                    Text('Order Placed',
                                        style: AppTextStyle.loginTitleMedium),
                                    const SizedBox(height: 15),
                                    const Text('Order ID:',
                                        style: AppTextStyle.caption1),
                                    const SizedBox(height: 5),
                                    const Text('#123456789',
                                        style: AppTextStyle.formLabel),
                                    const SizedBox(height: 20),
                                    const Text.rich(
                                      TextSpan(
                                        text: 'Delivery OTP - ',
                                        style: AppTextStyle.caption1,
                                        children: [
                                          TextSpan(
                                            text: '7548',
                                            style: TextStyle(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                        'Share this with the delivery person',
                                        style: AppTextStyle.formLabel),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // TRACK ORDER button at bottom
                    if (step == 3)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: CustomActionButton.orangeBorderWithIcon(
                          text: "TRACK ORDER",
                          icon:
                              const Icon(Icons.edit, color: Colors.transparent),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.orderTrackingRoute);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Close button above bottom sheet
        Positioned(
          bottom: screenHeight * 0.65 + 5,
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
