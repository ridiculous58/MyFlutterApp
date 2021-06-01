import 'package:flutter/material.dart';
import 'package:iot_flutter/components/rounded_button.dart';
import 'package:iot_flutter/helper/auth_helper.dart';
import 'package:iot_flutter/helper/constants.dart';
import 'package:iot_flutter/services/notification/notification_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
     return HomeScreenState();
  }
}
enum Options{
  logout
}
class HomeScreenState extends State<HomeScreen> {
  FlutterToast flutterToast;

  @override
  void initState() {
    super.initState();
    flutterToast = FlutterToast(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("FE APPLICATION"),
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (Options value){
              selectProcess(value);
              Navigator.pushNamed(context, "/");
            },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
            PopupMenuItem(value: Options.logout,child: Text("Log Out"))
          ])
        ],
      ),
      body: Center(
        child: RoundedButton(
            text: "Yardım İste",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {
              NotificationService.send().then((value) {
                _showToast();
              });
            }),
      ),
    );
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("Yardım Isteme Başarılı"),
        ],
      ),
    );


    flutterToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }


  void selectProcess(Options value) {
    if(Options.logout == value){
      AuthHelper.sharedPreferences.then((value){
        value.remove("token");
      });
    }
  }
}
