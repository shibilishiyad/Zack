import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class ScratchCardPage extends StatelessWidget {
  const ScratchCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Scratch Card'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Scratcher(
            brushSize: 50,
            threshold: 50, // Percentage to complete scratching
            color: Colors.grey,
            onChange: (value) {
              debugPrint("Scratch progress: $value%");
            },
            // onThreshold: () {
            //   debugPrint("Threshold reached");
            //   // You can add logic here, like showing a dialog.
            // },
            // child: Container(
            //   height: 400,
            //   width: 400,
            //   color: Colors.white,
            //   child: Center(
            //     child: Text(
            //       "Congratulations!\nYou've won a gift!",
            //       textAlign: TextAlign.center,
            //       style: const TextStyle(
            //         fontSize: 24,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.deepPurple,
            //       ),
            //     ),
            //   ),
            // ),
            child: Placeholder(),
          ),
        ),
      ),
    );
  }
}