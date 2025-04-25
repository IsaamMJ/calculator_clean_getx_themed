import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcController extends GetxController {
  RxString expression = ''.obs;
  RxString result = ''.obs;

  final operators = ['+', '-', '*', '/', '×', '÷'];

  void onButtonPressed(String value) {
    if (value == 'C') {
      expression.value = '';
      result.value = '';
    } else if (value == '⌫') {
      if (expression.value.isNotEmpty) {
        expression.value =
            expression.value.substring(0, expression.value.length - 1);
      }
    } else if (value == '=') {
      try {
        Parser p = Parser();
        Expression exp = p.parse(
            expression.value.replaceAll('×', '*').replaceAll('÷', '/'));
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        result.value = eval.toString();
      } catch (e) {
        result.value = 'Error';
      }
    } else {

      if (expression.value.isEmpty && value == '-') {
        expression.value += value;
        return;
      }

      String lastChar = expression.value.isNotEmpty
          ? expression.value[expression.value.length - 1]
          : '';

      if (operators.contains(lastChar) && operators.contains(value)) {
        return;
      }

      expression.value += value;
    }
  }
}
