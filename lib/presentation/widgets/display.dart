import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calcapp/controller/calcpage_controller.dart';

class DisplayWidget extends StatelessWidget {
  const DisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalcController>();

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
          Obx(() => Text(
            controller.expression.value,
            style: const TextStyle(fontSize: 32, color: Colors.white70),
            maxLines: 1,
            // softWrap: true,
            overflow: TextOverflow.visible,
          )),
          const SizedBox(height: 8),
          Obx(() => Text(
            controller.result.value,
            style: const TextStyle(fontSize: 48, color: Colors.white),
            maxLines: 1,
            // softWrap: true,
            overflow: TextOverflow.visible,
          )),

        ],
      ),
    );
  }
}
