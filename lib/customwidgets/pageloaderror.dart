import 'package:flutter/material.dart';
import 'package:trygetx/network/networkerrors.dart';
class PageErrorView extends StatelessWidget {
  Function onClick;
  dynamic error;
  PageErrorView(this.onClick, this.error);
  @override
  Widget build(BuildContext context) {
    String msg = 'Error occurred';
    if(error is ServerError){
      msg = (error as ServerError).msg;
    }
    if(error is NoInternetError){
      msg = (error as NoInternetError).msg;
    }
    if(error is NoData){
      msg = (error as NoData).msg;
    }
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(msg??''),
            TextButton(onPressed: (){
             onClick();
            }, child: Text('Retry'))

          ],
        ),
      ),);
  }
}
