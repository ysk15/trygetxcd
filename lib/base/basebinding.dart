import 'package:get/get.dart';
import 'package:trygetx/base/basecontroller.dart';

class BaseBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(() => BaseController());
  }

}