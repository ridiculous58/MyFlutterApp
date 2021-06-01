import 'package:flutter/material.dart';
import 'package:iot_flutter/helper/constants.dart';
import 'package:iot_flutter/screens/login/components/body.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FE APPLICATION"),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }

}