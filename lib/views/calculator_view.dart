import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart'; // importing the controller
import '../widgets/calculator_button.dart';       // importing the button widget
import 'converter_screen.dart'; // Import the converter screen

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final CalculatorController _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          // Navigation button at the top
          SizedBox(
            height: 40, // Limit the height of the button
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConverterScreen(),
                    ),
                  );
                },
                child: const Text("Kilometer to Mile Converter"),
              ),
            ),
          ),

          // Display area for the result
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              child: Text(
                _controller.result, // Use the result from the controller
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),

          const Divider(thickness: 1, color: Colors.grey),

          // Grid of calculator buttons
          Expanded(
            flex: 3, // Allocate more space to the button grid
            child: GridView.builder(
              itemCount: _controller.buttons.length, // number of buttons
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 buttons per row
              ),
              itemBuilder: (context, index) {
                return CalculatorButton(
                  label: _controller.buttons[index], // label for the button
                  onTap: () {
                    setState(() {
                      _controller.onButtonPress(_controller.buttons[index]);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
