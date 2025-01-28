import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final double? subtotal;
  final double? shippingFee;
  final double? total;
  final bool
      showFullWidget; // New parameter to control if we show full widget or just the button
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final Color buttoncolor;
  final double? buttonwidth;

  const SummaryWidget({
    super.key,
    this.subtotal,
    this.shippingFee,
    this.total,
    this.showFullWidget = true, // Default to showing the full widget
    this.buttonText = 'Place Order', // Default button text
    this.onButtonPressed, // Optional callback for the button
    required this.buttoncolor,
    this.buttonwidth,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showFullWidget) // Only show subtotal, shipping, and total if showFullWidget is true
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.black12.withOpacity(.1),
                width: screenWidth,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bill Header
                    Text(
                      'Receipt',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const Divider(color: Colors.black),

                    // Subtotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${subtotal?.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Shipping Fee
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Fee:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${shippingFee?.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${total?.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Divider(color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        const SizedBox(height: 16),
        Container(
          width: screenWidth,
          color: Colors.white,
          child: Center(
            child: ElevatedButton(
              onPressed: onButtonPressed,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(screenWidth - 80, 50),
                foregroundColor: Colors.white,
                backgroundColor: buttoncolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
