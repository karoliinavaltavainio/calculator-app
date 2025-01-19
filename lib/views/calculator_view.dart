import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart';
import '../widgets/calculator_button.dart';
import 'converter_screen.dart';

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
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    child: const Text("View History"),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              child: Text(
                _controller.result,
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),

          const Divider(thickness: 1, color: Colors.grey),

          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: _controller.buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return CalculatorButton(
                  label: _controller.buttons[index],
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
