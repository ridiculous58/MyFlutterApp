import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_flutter/components/rounded_button.dart';
import 'package:iot_flutter/data/api/user_service.dart';
import 'package:iot_flutter/helper/constants.dart';
import 'package:iot_flutter/screens/login/login_screen.dart';
import 'package:iot_flutter/screens/signup/signup_screen.dart';
import 'package:iot_flutter/screens/welcome/components/background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Yardım Etmeye Hoş Geldiniz",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.05,),
          RoundedButton(
            text: "Giriş Yap",
            press: (){
              goToLoginScreen(context);
            },
          ),
          RoundedButton(
            text: "Kayıt Ol",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: (){
              goToSignUpScreen(context);
            },
          ),
        ],
      ),
    ));
  }

  void goToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, "/login");
  }

  void goToSignUpScreen(BuildContext context) {
    Navigator.pushNamed(context, "/signup");
  }

}
