import 'package:flutter/material.dart';
import 'package:iot_flutter/blocs/rounded_password_field_bloc.dart';
import 'package:iot_flutter/components/rounded_button.dart';
import 'package:iot_flutter/components/text_field_container.dart';
import 'package:iot_flutter/data/api/password_data.dart';
import 'package:iot_flutter/helper/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: roundedPasswordBloc.getStream,
      initialData: PasswordData.isObscureText,
      builder: (context,snapshot){
        return TextFieldContainer(
          child: TextField(
            obscureText: snapshot.data,
            onChanged: onChanged,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: TextButton(
                  child: Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  onPressed: (){
                    roundedPasswordBloc.changeObscureText(!snapshot.data);
                  },
                ),
                border: InputBorder.none
            ),
          ),
        );
      },
    );
  }
}
