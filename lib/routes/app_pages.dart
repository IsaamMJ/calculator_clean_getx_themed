import 'package:calcapp/presentation/bindings/calcpage_binding.dart';
import 'package:calcapp/presentation/pages/calcpage.dart';
import 'package:get/get.dart';
import 'app_routes.dart';


class AppPages{
 static final pages =[
   GetPage(
     name: AppRoutes.calc,
     page: () => const CalcPage(),
     binding: CalcBindings()
   )
 ];
}