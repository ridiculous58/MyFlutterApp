import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iot_flutter/blocs/user_bloc.dart';
import 'package:iot_flutter/components/already_have_an_account_acheck.dart';
import 'package:iot_flutter/components/rounded_button.dart';
import 'package:iot_flutter/components/rounded_input_field.dart';
import 'package:iot_flutter/components/rounded_password_field.dart';
import 'package:iot_flutter/models/user.dart';
import 'package:iot_flutter/models/user_register.dart';
import 'package:iot_flutter/screens/login/login_screen.dart';
import 'package:iot_flutter/screens/signup/components/background.dart';
import 'package:iot_flutter/screens/signup/components/or_divider.dart';
import 'package:iot_flutter/screens/signup/components/soical_icon.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserRegister user = new UserRegister();
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03,),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your FirstName",
              onChanged: (value) {
                user.firstName = value;
              },
            ),
            RoundedInputField(
              hintText: "Your LastName",
              onChanged: (value) {
                user.lastName = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                user.email = value;
              },
            ),
            RoundedInputField(
              hintText: "Your PhoneNumber",
              onChanged: (value) {
                user.phoneNumber = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                user.password = value;
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                userBloc.userRegister(user).then((value){
                  Navigator.pushNamed(context, "/home");
                });
              },
            ),
            SizedBox(height: size.height * 0.03,),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: (){
                gotoLoginScreen(context);
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
  gotoLoginScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LoginScreen();
    }));
  }
}
