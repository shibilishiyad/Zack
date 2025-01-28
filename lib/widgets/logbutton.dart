import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? bwidth; 

  const CustomButton({
    super.key, 
    required this.text, 
    required this.onPressed, 
    this.bwidth, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bwidth ?? double.infinity, 
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0), 
          foregroundColor: Colors.white, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0), 
            side: const BorderSide(color: Colors.white54),
          ),
          elevation: 0, 
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
