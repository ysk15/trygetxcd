import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trygetx/customwidgets/bottomcircleloader.dart';
import 'package:trygetx/customwidgets/customlistloader.dart';
import 'package:trygetx/customwidgets/nointernetwidget.dart';
import 'package:trygetx/customwidgets/pageloaderror.dart';
import 'package:trygetx/listingpage/controller/listingcontroller.dart';
import 'package:trygetx/listingpage/model/apiresmodel.dart';
import 'package:trygetx/network/networkerrors.dart';
class ListingPage extends StatefulWidget {

  @override
  _ListingPageState createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  var controller = Get.find<ListingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Obx(
          ()=>controller.isConnected.value?
              RefreshIndicator(
          onRefresh: ()=>Future.sync(()=>controller.pagingController.refresh()),
          child: PagedListView<int,Datum>(
            pagingController: controller.pagingController, builderDelegate: PagedChildBuilderDelegate<Datum>(
            itemBuilder: (context, item, index) =>
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(item.id??''),
                      Text(item.name??''),
                    ],
                  ),
                ),
            firstPageErrorIndicatorBuilder: (_) => PageErrorView((){
              controller.pagingController.refresh();
            }, controller?.pagingController?.error),
            firstPageProgressIndicatorBuilder: (_) => CustomListLoader(),
            newPageProgressIndicatorBuilder: (_) => Center(
                child: BottomCircularLoader()),
          ),
                ),

          ):PageErrorView((){
            controller.pagingController.refresh();
          }, NoInternetError(),),
      ),
      );

  }
}
