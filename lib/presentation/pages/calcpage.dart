import 'package:flutter/material.dart';
import 'package:calcapp/presentation/widgets/display.dart';
import '../widgets/button.dart';
import 'package:get/get.dart';
import '../../controller/calcpage_controller.dart';
import 'package:calcapp/controller/theme_controller.dart';

class CalcPage extends StatelessWidget {
  const CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalcController>();
    final themeCtrl = Get.find<ThemeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Obx(() => IconButton(
            icon: Icon(
              themeCtrl.isDark.value ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: themeCtrl.toggleTheme,
          )),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 12),
              DisplayWidget(),
              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(child: buildButton('7', Colors.grey, () => controller.onButtonPressed('7'))),
                  Expanded(child: buildButton('8', Colors.grey, () => controller.onButtonPressed('8'))),
                  Expanded(child: buildButton('9', Colors.grey, () => controller.onButtonPressed('9'))),
                  Expanded(child: buildButton('÷', Colors.orange, () => controller.onButtonPressed('÷'))),
                ],
              ),

              Row(
                children: [
                  Expanded(child: buildButton('4', Colors.grey, () => controller.onButtonPressed('4'))),
                  Expanded(child: buildButton('5', Colors.grey, () => controller.onButtonPressed('5'))),
                  Expanded(child: buildButton('6', Colors.grey, () => controller.onButtonPressed('6'))),
                  Expanded(child: buildButton('×', Colors.orange, () => controller.onButtonPressed('×'))),
                ],
              ),

              Row(
                children: [
                  Expanded(child: buildButton('1', Colors.grey, () => controller.onButtonPressed('1'))),
                  Expanded(child: buildButton('2', Colors.grey, () => controller.onButtonPressed('2'))),
                  Expanded(child: buildButton('3', Colors.grey, () => controller.onButtonPressed('3'))),
                  Expanded(child: buildButton('-', Colors.orange, () => controller.onButtonPressed('-'))),
                ],
              ),
              Row(
                children: [
                  Expanded(child: buildButton('C', Colors.grey, () => controller.onButtonPressed('C'))),
                  Expanded(child: buildButton('0', Colors.grey, () => controller.onButtonPressed('0'))),
                  Expanded(child: buildButton('.', Colors.grey, () => controller.onButtonPressed('.'))),
                  Expanded(child: buildButton('+', Colors.orange, () => controller.onButtonPressed('+'))),
                ],
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: buildButton('=', Colors.deepOrange, () => controller.onButtonPressed('=')),
                  ),
                  Expanded(
                    flex: 1,
                    child: buildButton('⌫', Colors.orange, () => controller.onButtonPressed('⌫')),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
