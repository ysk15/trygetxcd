import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class BaseController extends GetxController{
  StreamSubscription networkState;
  RxBool _isConnected = true.obs;
  get isConnected => _isConnected;
  @override
  void onInit() {
try {

  networkState = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile) {
      print('yes internet');
      _isConnected.value =true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('yes internet');
      _isConnected.value =true;
    }
    else{
      print('no internet');
      _isConnected.value =false;
    }
  });
} catch (e) {
  print(e);
}
    super.onInit();
  }
  @override
  void onClose() {
    networkState.cancel();
    super.onClose();
  }
}