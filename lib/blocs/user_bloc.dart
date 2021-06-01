import 'dart:async';

import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:iot_flutter/data/api/user_service.dart';
import 'package:iot_flutter/helper/auth_helper.dart';
import 'package:iot_flutter/interceptors/auth_interceptor.dart';
import 'package:iot_flutter/models/response/auth_response.dart';
import 'package:iot_flutter/models/user.dart';
import 'package:iot_flutter/models/user_login.dart';
import 'package:iot_flutter/models/user_register.dart';
import 'package:http/http.dart' as http;

class UserBloc {
  final userStreamController = StreamController.broadcast();

  Stream get getStream => userStreamController.stream;
   Client client = HttpClientWithInterceptor.build(interceptors: [
    AuthInterceptor(),
  ]);

  Future userRegister(UserRegister userRegister) async {
    AuthResponse authResponse = await UserService.userRegister(userRegister);
    if (authResponse.token != null) {
      AuthHelper.setToken(authResponse.token);
    }
    userStreamController.sink.add(UserService.getUsers());

  }

  Future loginUser(UserLogin userLogin) async {
    AuthResponse authResponse = await UserService.userLogin(userLogin);
    if (authResponse.token != null) {
      AuthHelper.setToken(authResponse.token);
    }
    userStreamController.sink.add(UserService.getUsers());
  }

  Future<bool> isLogin() async {
    return await AuthHelper.isLogin();
  }

  Future<List<User>> getUsers() async{
   return await UserService.getUsers();
  }
}

final userBloc = UserBloc();
