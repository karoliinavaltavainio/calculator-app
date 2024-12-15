import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label; // label of the button
  final VoidCallback onTap;

  CalculatorButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: "0123456789".contains(label) ? Colors.grey[300] : Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 24,
                color: "0123456789".contains(label) ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
