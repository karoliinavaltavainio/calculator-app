import 'package:flutter/material.dart';
import '../controllers/conversion_controller.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _kmController = TextEditingController();
  String _resultMessage = "";

  void _convertKmToMiles() {
    final kilometers = double.tryParse(_kmController.text);
    if (kilometers != null) {
      final miles = ConversionController.kmToMiles(kilometers);
      setState(() {
        _resultMessage = "${kilometers.toStringAsFixed(2)} km = ${miles.toStringAsFixed(2)} miles";
      });
    } else {
      setState(() {
        _resultMessage = "Please enter a valid number.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kilometer to Mile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input field
            TextField(
              controller: _kmController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter kilometers",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Result display
            Text(
              _resultMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // convert button
            ElevatedButton(
              onPressed: _convertKmToMiles,
              child: const Text("Convert"),
            ),

            const Spacer(), // pushes the Back button to the bottom

            // back button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // navigate back to the calculator screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              child: const Text("Back to Calculator"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _kmController.dispose();
    super.dispose();
  }
}
