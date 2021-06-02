import 'package:flutter/material.dart';
import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final width;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFieldContainer(
          width: width ,
          child: TextField(
            obscureText: true,
            onChanged: onChanged,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Password",
                // counterText: snapshot.data,
                // counterStyle: TextStyle(
                //   color: Colors.black54,
                //   fontSize: 10,
                //   fontStyle: FontStyle.italic),
              icon: Icon(
                Icons.lock,
                color: kPrimaryColor,
              ),
              suffixIcon: Icon(
                Icons.visibility,
                color: kPrimaryColor,
              ),
              border: InputBorder.none,
            ),
          ),
        );
      }
    );
  }
}
