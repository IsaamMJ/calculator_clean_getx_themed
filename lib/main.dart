import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calcapp/routes/app_pages.dart';
import 'package:calcapp/routes/app_routes.dart';
import 'controller/theme_controller.dart';

void main() {
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeCtrl = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeCtrl.isDark.value ? ThemeMode.dark : ThemeMode.light,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.calc,
    ));
  }
}
