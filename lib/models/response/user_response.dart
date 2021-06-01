import '../user.dart';

class UserResponse{
  String message;
  bool success;
  List<dynamic> data;

  UserResponse();
  UserResponse.all(this.message, this.success,this.data);


  UserResponse.fromJson(Map json){
    message =  json["message"];
    success = json["success"];
    data = json["data"];
  }
  Map toJson(){
    return {
      "message":message,
      "success":success,
      "data":data
    };
  }
}