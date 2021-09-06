import 'dart:io';

import 'package:trygetx/network/apiresponse.dart';
import 'package:http/http.dart' as http;
import 'package:trygetx/network/networkerrors.dart';

class Repo{
Future<ApiResponse> getData(String pageNo)async{
  try {
    var result = await http.get(Uri.parse('https://api.instantwebtools.net/v1/passenger?page='+pageNo+'&size=10'));
    if(result.statusCode==200){
       return ApiResponse.success(result.body);
      }
      else{
        return ApiResponse.error(ServerError());
      }
  } on SocketException{
    return ApiResponse.error(NoInternetError());
  }
  catch (e) {
    print(e);
    return ApiResponse.error(ServerError(msg: 'Unknown error occurred'));
  }
}
}