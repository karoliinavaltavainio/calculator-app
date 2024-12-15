import 'package:flutter/material.dart';
import 'views/calculator_view.dart'; // imported the calculator view (UI)

void main() {
  runApp(CalculatorApp()); // this calls out the CalculatorApp widget
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes the debug banner
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: CalculatorView(), // the main screen is the view (UI)
    );
  }
}