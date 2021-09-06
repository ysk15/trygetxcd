import 'dart:convert';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trygetx/base/basecontroller.dart';
import 'package:trygetx/listingpage/model/apiresmodel.dart';
import 'package:trygetx/listingpage/repo/repo.dart';
import 'package:trygetx/network/networkerrors.dart';

class ListingController extends BaseController{
  var repo = Get.find<Repo>();
  var _pageSize = 10;
  PagingController get pagingController => _pagingController;
  PagingController _pagingController = PagingController<int,Datum>(firstPageKey: 0);
  ListingController(){
    _pagingController.addPageRequestListener((pageKey) {
      getData(pageKey.toString());
    });
  }

  getData(String pageNo)async{
    var result = await repo.getData(pageNo);
    try {
      if(result.error==null){
            var listData = ApiResModel.fromJson(jsonDecode(result.response));
            if(listData.data.isNotEmpty){
              final isLastPage = listData.data.length < _pageSize;
              if (isLastPage) {
                _pagingController.appendLastPage(listData.data);
              } else {
                final nextPageKey =_pagingController.nextPageKey+1;
                _pagingController.appendPage(listData.data, nextPageKey);
              }
            }
            else{
              _pagingController.error=NoData();
            }
          }
          else{
         _pagingController.error=result.error;
          }
    } catch (e) {
      _pagingController.error=ServerError();
      print(e);
    }
  }
}