import '../controllers/history_database.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController {
  String result = "0";

  String input = "";

  List<String> buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

  void onButtonPress(String value) async {
    if (value == "C") {
      result = "0";
      input = "";
    } else if (value == "=") {
      if (input.isNotEmpty) {
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(input);

          ContextModel cm = ContextModel();
          double evalValue = exp.evaluate(EvaluationType.REAL, cm);

          result = evalValue.toString();
          result = result.replaceAll(RegExp(r'\.0$'), '');

          String timestamp = DateTime.now().toString();
          String calculation = '$input = $result';
          await HistoryDatabase.instance.addHistory(calculation, timestamp);

          input = result;
        } catch (e) {
          result = "Error";
        }
      }
    } else {
      if (input.length < 20) {
        input += value;
        result = input;
      }
    }
  }
}
