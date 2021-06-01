
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:iot_flutter/interceptors/auth_interceptor.dart';
import 'package:iot_flutter/models/response/auth_response.dart';
import 'package:iot_flutter/models/response/user_response.dart';
import 'package:iot_flutter/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:iot_flutter/models/user_login.dart';
import 'package:iot_flutter/models/user_register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserService {

  static String apiBaseUrl = "http://10.0.2.2:53851/api";
  static UserService _singleton = UserService._internal();
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static Client client = HttpClientWithInterceptor.build(interceptors: [
    AuthInterceptor(),
  ]);

  factory UserService(){
    return _singleton;
  }

  UserService._internal();

  static Future<AuthResponse> userRegister(UserRegister userRegister) async {
    AuthResponse authResponse;
    var requestUrl = Uri.parse(apiBaseUrl + "/auth/register");
    var response = await client.post(requestUrl, body: jsonEncode(userRegister),headers: headers);
    dynamic decode = json.decode(response.body);
    authResponse = AuthResponse.fromJson(decode);
    return authResponse;
  }

  static Future<AuthResponse> userLogin(UserLogin userLogin) async {
    AuthResponse authResponse;
    var requestUrl = apiBaseUrl + "/auth/login";
    var response  = await client.post(Uri.parse(requestUrl),body: jsonEncode(userLogin),headers: headers);
    dynamic decode = json.decode(response.body);
    authResponse = AuthResponse.fromJson(decode);
    return authResponse;
  }

  static Future<List<User>> getUsers() async{
    var requestUrl = apiBaseUrl + "/users/getAll";
    var response = await client.get(Uri.parse(requestUrl),headers: headers);
    var decode = json.decode(response.body);
    var userResponse = UserResponse.fromJson(decode);
    List<User> users = List<User>();
    for(var user in userResponse.data){
      users.add(User.fromJson(user));
    }
    return users;
  }

  //var response = await Requests.post(
 // requestUrl, json: userLogin.toJson(), headers:headers);


}