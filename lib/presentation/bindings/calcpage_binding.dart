import 'package:calcapp/controller/calcpage_controller.dart';
import 'package:get/get.dart';

class CalcBindings extends Bindings {
  @override
  void dependencies() {
  
    Get.lazyPut(() => CalcController());

  }
}