import 'package:flutter_sms/flutter_sms.dart';
import 'package:iot_flutter/blocs/user_bloc.dart';
import 'package:iot_flutter/models/user.dart';
import 'package:iot_flutter/services/location/location_service.dart';

class NotificationService {
  static Future send() async {
    try {
      List<String> recipients = List<String>();
      List<User> users = await userBloc.getUsers();
      for (var user in users) {
        if (user.phoneNumber != null) {
          recipients.add(user.phoneNumber);
        }
      }
      String message = await getMessage();
      String _result =
          await FlutterSms.sendSMS(message: message, recipients: recipients);
    } catch (error) {
      print(error);
    }
  }

  static Future<String> getMessage() async {
    var currentLocation = await LocationService().getLocation();
    return "Location : " +
        "Enlem : " +
        currentLocation.latitude.toString() +
        " Boylam : " +
        currentLocation.longitude.toString() +
        " Olan Bir Kullanıcımızın Yardıma Ihtıyacı Vardır";
  }
}
