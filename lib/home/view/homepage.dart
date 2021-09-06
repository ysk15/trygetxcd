import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trygetx/customwidgets/pageloaderror.dart';
import 'package:trygetx/home/controller/homecontroller.dart';
import 'package:trygetx/locale/localeservice.dart';
import 'package:trygetx/network/networkerrors.dart';
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return controller.isConnected.value?
    Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('title'.tr,style: TextStyle(fontSize: 24),),
                  SizedBox(height: 36,),
                  Text('I am  GetX'),
                  TextButton(
                          onPressed: (){
                          controller.getData();
                          },
                          child:
                          Container(
                          color: Colors.tealAccent,
                          height: 40,
                          width: double.infinity,
                          child: Center(child:
                          Obx(()=> controller.isLoading1.value?Container(height:36,width:36,child: CircularProgressIndicator()):Text('Click me'))
                          ))),
                  TextButton(
                      onPressed: (){
                        var loc = Get.deviceLocale;
                        print(loc.languageCode);
                        LocaleService().changeLocale('English');
                      },
                      child:
                      Text('English')),
                  TextButton(
                      onPressed: (){
                        LocaleService().changeLocale('മലയാളം');
                      },
                      child:
                      Text('Malayalam')),
                ],
              ),
            ),
            Obx(()=> controller.isLoading.value?Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey.withOpacity(0.3),
                child: Center(child: CircularProgressIndicator())):Container(height: 0,width: 0,)),

          ],
        ),
      ),

    ):PageErrorView((){}, NoInternetError());
  }
}
