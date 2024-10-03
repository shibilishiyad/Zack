import 'package:flutter/material.dart';
import 'package:zack_shoping/view/home.dart';
import 'package:zack_shoping/widgets/button.dart';

class OrderCompletePage extends StatefulWidget {
  const OrderCompletePage({super.key});

  @override
  _OrderCompletePageState createState() => _OrderCompletePageState();
}

class _OrderCompletePageState extends State<OrderCompletePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the fade animation
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push content to top and bottom
            children: [
           const   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                   Padding(
                     padding: EdgeInsets.only(top: 160),
                     child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 100,
                                       ),
                   ),
                   SizedBox(height: 20),
                   Text(
                    'Your order has been placed successfully!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                   SizedBox(height: 10),
                   Text(
                    'We value your trust in our products!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              // Continue Shopping button at the bottom
              Padding(
                padding: const EdgeInsets.all(16.0), // Add some padding for better spacing
                child: SummaryWidget(
                  subtotal: 0.0,
                  shippingFee: 0.0,
                  total: 0.0,
                  showFullWidget: false, // Only show the button
                  buttonText: 'Continue Shopping',
                  onButtonPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
