import 'package:flutter/material.dart';

class StepProcces extends StatelessWidget {
  final int currentStep; // 0: الموقع، 1: الدور، 2: الغرفة، 3: الكل مختار
  const StepProcces({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildStepCircle('1', 0),
        buildStepLine(),
        buildStepCircle('2', 1),
        buildStepLine(),
        buildStepCircle('3', 2),
      ],
    );
  }

  Widget buildStepCircle(String number, int step) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: currentStep >= step ? Color(0xFF2C4067) : Colors.grey[400],
      child: Text(
        number,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildStepLine() {
    return Container(width: 40, height: 4, color: Color(0xFF2C4067));
  }
}
