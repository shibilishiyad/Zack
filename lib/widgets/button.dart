import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final double subtotal;
  final double shippingFee;
  final double total;
  final bool showFullWidget; // New parameter to control if we show full widget or just the button
  final String buttonText;
  final VoidCallback? onButtonPressed;

  const SummaryWidget({
    super.key,
    required this.subtotal,
    required this.shippingFee,
    required this.total,
    this.showFullWidget = true, // Default to showing the full widget
    this.buttonText = 'Place Order', // Default button text
    this.onButtonPressed, // Optional callback for the button
  });

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width - 20;

    return Column(
      children: [
        if (showFullWidget) // Only show subtotal, shipping, and total if showFullWidget is true
          Column(
            children: [
              const SizedBox(height: 20),
              Container(
                color: Colors.black12,
                width: buttonWidth,
                child: Column(
                  children: [
                    Text('Subtotal: \$${subtotal.toStringAsFixed(2)}'),
                    const SizedBox(height: 2),
                    Text('Shipping Fee: \$${shippingFee.toStringAsFixed(2)}'),
                    const SizedBox(height: 2),
                    Text('Total: \$${total.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: onButtonPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
            ),
            child: Text(
              buttonText,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
