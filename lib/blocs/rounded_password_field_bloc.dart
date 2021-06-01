import 'dart:async';

import 'package:iot_flutter/data/api/password_data.dart';

class RoundedPasswordFieldBloc{

  final roundedPasswordController = StreamController.broadcast();

  Stream get getStream => roundedPasswordController.stream;

  void changeObscureText(bool newValue){
    PasswordData.isObscureText = newValue;
    roundedPasswordController.sink.add(PasswordData.isObscureText);
  }

}

final roundedPasswordBloc = RoundedPasswordFieldBloc();