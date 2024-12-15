class CalculatorController {
  String result = "0"; // the current result showed on the screen
  String input = ""; // the number currently being entered
  String operator = ""; // stores the last operation used (+, - ..)
  double? num1; // the first number in the operation

  // list of all the buttons
  List<String> buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  // what happens when a button is pressed
  void onButtonPress(String value) {
    if (value == "C") {
      // clears everything
      result = "0";
      input = "";
      operator = "";
      num1 = null;
    } else if (value == "=") {
      // perform the calculation when "=" is pressed
      if (num1 != null && operator.isNotEmpty) {
        double num2 = double.tryParse(input) ?? 0; // input to number
        switch (operator) {
          case "+":
            result = (num1! + num2).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
            break;
          case "-":
            result = (num1! - num2).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
            break;
          case "*":
            result = (num1! * num2).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '');
            break;
          case "/":
            result = num2 != 0
                ? (num1! / num2).toStringAsFixed(2).replaceAll(RegExp(r'\.00$'), '')
                : "Error"; // prevent division by 0
            break;
        }
        // resets
        input = "";
        operator = "";
        num1 = null;
      }
    } else if ("+-*/".contains(value)) {
      // store the first number and operator
      num1 = double.tryParse(input) ?? 0;
      operator = value;
      input = ""; // clear the input for next number
    } else {
      if (input.length < 12) {
        // update the input for numbers
        input += value;
        result = input;
      }
    } // <- Missing closing brace for the outer else
  } // <- Closing brace for onButtonPress
}
