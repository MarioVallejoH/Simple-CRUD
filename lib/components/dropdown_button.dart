import 'package:flutter/material.dart';
import 'package:flutter_auth/bloc/bloc.dart';
// import 'package:flutter_auth/bloc/bloc.dart';.
import 'package:flutter_auth/components/text_field_container.dart';
// import 'package:flutter_auth/constants.dart';

class DropDownRounded extends StatelessWidget {
  final List items;
  // final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Stream stream;
  final double width;
  final String kind;
  // final String initialValue;
  const DropDownRounded({
    Key key,
    // this.hintText,
    this.kind,
    this.items,
    this.icon = Icons.person,
    this.onChanged,
    this.stream,
    this.width,
    // this.initialValue
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return TextFieldContainer(
          width: width,
          
          child: DropdownButton<String>(
            isExpanded: true,
            value: kind=='doc'?bloc.docType:bloc.event,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: onChanged,
            
            items: items
                .map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value,

                child: Center(
                  child: Text(
                    value,
                    ),
                ),
              );
            }).toList(),
          )
        );
      }
    );
  }
}