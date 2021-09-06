import 'package:get/get.dart';
import 'package:trygetx/home/controller/homecontroller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}