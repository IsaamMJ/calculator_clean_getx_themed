import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calcapp/controller/calcpage_controller.dart';

class DisplayWidget extends StatefulWidget {
  const DisplayWidget({super.key});

  @override
  State<DisplayWidget> createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  final controller = Get.find<CalcController>();
  final ScrollController _expressionScrollCtrl = ScrollController();
  final ScrollController _resultScrollCtrl = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.expression.listen((_) {
      _expressionScrollCtrl.jumpTo(_expressionScrollCtrl.position.maxScrollExtent);
    });

    controller.result.listen((_) {
      _resultScrollCtrl.jumpTo(_resultScrollCtrl.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Obx(() => SingleChildScrollView(
            controller: _expressionScrollCtrl,
            scrollDirection: Axis.horizontal,
            reverse: false,
            child: Text(
              controller.expression.value,
              style: const TextStyle(fontSize: 32, color: Colors.white70),
            ),
          )),
          const SizedBox(height: 8),
          Obx(() => SingleChildScrollView(
            controller: _resultScrollCtrl,
            scrollDirection: Axis.horizontal,
            reverse: false,
            child: Text(
              controller.result.value,
              style: const TextStyle(fontSize: 48, color: Colors.white),
            ),
          )),
        ],
      ),
    );
  }
}
