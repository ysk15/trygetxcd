import 'package:get/get.dart';
import 'package:trygetx/listingpage/controller/listingcontroller.dart';
import 'package:trygetx/listingpage/repo/repo.dart';

class ListingBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Repo());
    Get.put(ListingController());
  }

}