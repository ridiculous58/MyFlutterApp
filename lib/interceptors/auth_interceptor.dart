import 'package:http_interceptor/http_interceptor.dart';
import 'package:iot_flutter/helper/auth_helper.dart';

class AuthInterceptor implements InterceptorContract{
  @override
  Future<RequestData> interceptRequest({RequestData data}) async{
    try {
      data.headers["Content-Type"] = "application/json";
      data.headers["Authorization"] = "Bearer " + (await AuthHelper.sharedPreferences).getString("token");
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async{
    return data;
  }
  
}