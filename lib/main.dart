import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trygetx/base/basebinding.dart';
import 'package:trygetx/base/theme.dart';
import 'package:trygetx/home/binding/homebinding.dart';
import 'package:trygetx/home/controller/homecontroller.dart';
import 'package:trygetx/home/view/homepage.dart';
import 'package:trygetx/listingpage/bindings/listpagebinding.dart';
import 'package:trygetx/listingpage/view/listingpage.dart';
import 'package:trygetx/locale/localeservice.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: AppTheme().theme,
      initialBinding: BaseBinding(),
      initialRoute: '/home',
      locale: LocaleService.locale,
      fallbackLocale: LocaleService.fallbackLocale,
      translations: LocaleService(),
      getPages: [
        GetPage(name: '/list', page: () => ListingPage(), binding: ListingBinding()),
        GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
      ],
    );
  }
}


