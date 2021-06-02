import 'package:flutter/material.dart';
import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Stream stream;
  final double width;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.stream,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFieldContainer(
          width: width,
          child: TextField(
            onChanged: onChanged,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              icon: Icon(
                icon,
                color: kPrimaryColor,
              ),
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        );
      }
    );
  }
}
