import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zack_shoping/controllers/provider/notification_provider.dart';
import 'package:zack_shoping/view/display.dart';


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

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 160),
                    child: Icon(
                      Icons.check_circle_outline,
                      color: Colors.black,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your order has been placed successfully!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We value your trust in our products!',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ElevatedButton(
                  
                  onPressed: () {
                    
                  context.read<NotificationProvider>().addNotification(
                  ' New notification at ${DateTime.now()}',
                );
                
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDisplayPage(index: -1),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                     minimumSize: Size(screenWidth - 80, 50),
                    
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    
                  ),
                  child: const Text('Continue Shopping',style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
