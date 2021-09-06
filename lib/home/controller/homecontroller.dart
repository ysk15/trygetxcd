import 'package:get/get.dart';
import 'package:trygetx/base/basecontroller.dart';

class HomeController extends  BaseController{
  RxBool isLoading = false.obs;
  RxBool isLoading1 = false.obs;
  getData(){
   isLoading.value=true;
   Future.delayed(Duration(seconds: 3),(){
     isLoading.value=false;
   });
  }

  getData1(){
    isLoading1.value=true;
    Future.delayed(Duration(seconds: 3),(){
      isLoading1.value=false;
    });
  }

}