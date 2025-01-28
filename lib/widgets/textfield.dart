import 'package:flutter/material.dart';

class Mywidgets {
  Widget mytextField({
    required String labelText,
    double? width,
    required TextEditingController controller, 
    String? Function(String?)? validator, 
  }) {
    return SizedBox(
      width: width,
      child: TextFormField(  
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(),
        ),
        style: const TextStyle(color: Colors.white),
        validator: validator, 
      ),
    );
  }
}
