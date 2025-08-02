import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calcapp/controller/calcpage_controller.dart';
import 'package:calcapp/controller/theme_controller.dart';
import '../widgets/button.dart';
import '../widgets/display.dart';

class CalcPage extends StatelessWidget {
  const CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalcController>();
    final themeCtrl = Get.find<ThemeController>();
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

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
        child: isPortrait
            ? _buildPortraitLayout(controller)
            : _buildLandscapeLayout(controller),
      ),
    );
  }

  Widget _buildPortraitLayout(CalcController controller) {
    return Column(
      children: [
        const SizedBox(height: 12),
        const DisplayWidget(),
        const SizedBox(height: 12),
        Expanded(
          child: Column(
            children: [
              _buildButtonRow(controller, ['7', '8', '9', '÷']),
              _buildButtonRow(controller, ['4', '5', '6', '×']),
              _buildButtonRow(controller, ['1', '2', '3', '-']),
              _buildButtonRow(controller, ['C', '0', '.', '+']),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(CalcController controller) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const DisplayWidget(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(child: _buildButtonRow(controller, ['7', '8', '9', '÷'])),
              Expanded(child: _buildButtonRow(controller, ['4', '5', '6', '×'])),
              Expanded(child: _buildButtonRow(controller, ['1', '2', '3', '-'])),
              Expanded(child: _buildButtonRow(controller, ['C', '0', '.', '+'])),
              Expanded(
                child: Row(
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
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonRow(CalcController controller, List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((text) {
          Color color = (text == '+' || text == '-' || text == '×' || text == '÷')
              ? Colors.orange
              : Colors.grey;
          if (text == 'C') color = Colors.grey;
          if (text == '=') color = Colors.deepOrange;
          if (text == '⌫') color = Colors.orange;

          return Expanded(
            child: buildButton(text, color, () => controller.onButtonPressed(text)),
          );
        }).toList(),
      ),
    );
  }
}
