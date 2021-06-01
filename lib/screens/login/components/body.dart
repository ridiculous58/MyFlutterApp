import 'package:flutter/material.dart';
import 'package:iot_flutter/blocs/user_bloc.dart';
import 'package:iot_flutter/components/already_have_an_account_acheck.dart';
import 'package:iot_flutter/components/rounded_button.dart';
import 'package:iot_flutter/components/rounded_input_field.dart';
import 'package:iot_flutter/components/rounded_password_field.dart';
import 'package:iot_flutter/models/user_login.dart';
import 'package:iot_flutter/screens/login/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iot_flutter/screens/signup/signup_screen.dart';

class Body extends StatelessWidget{
  const Body({
   Key key, }):super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email;
    String password;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("LOGIN",style: TextStyle(fontWeight:  FontWeight.bold),),
              SizedBox(height: size.height * 0.03,),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value){
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value){
                  password = value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: (){
                  userBloc.loginUser(UserLogin.all(email, password)).whenComplete(()
                  {
                    Navigator.pushNamed(context, "/home");
                  });
                },
              ),
              SizedBox(height: size.height * 0.03,),
              AlreadyHaveAnAccountCheck(
                press: (){
                  Navigator.pushNamed(context, "/signup");
                },
              )
            ],
          ),
        )
    );
  }
  
}