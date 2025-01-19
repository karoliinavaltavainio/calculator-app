import 'package:flutter/material.dart';
import 'views/calculator_view.dart';
import './views/history_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      // Main screen
      home: CalculatorView(),
      // Define routes
      routes: {
        '/history': (context) => HistoryView(),
      },
    );
  }
}
