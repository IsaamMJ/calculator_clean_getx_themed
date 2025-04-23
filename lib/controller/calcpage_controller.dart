import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcController extends GetxController {
  RxString expression = ''.obs;
  RxString result = ''.obs;

  void onButtonPressed(String value) {
    if (value == 'C') {
      // Clear everything
      expression.value = '';
      result.value = '';
    } else if (value == '⌫') {
      // Handle erase/backspace
      if (expression.value.isNotEmpty) {
        expression.value = expression.value.substring(0, expression.value.length - 1);
      }
    } else if (value == '=') {
      // Evaluate the expression
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression.value.replaceAll('×', '*').replaceAll('÷', '/'));
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        result.value = eval.toString();
      } catch (e) {
        result.value = 'Error';
      }
    } else {
      // Append any other value (number or operator)
      expression.value += value;
    }
  }

}
