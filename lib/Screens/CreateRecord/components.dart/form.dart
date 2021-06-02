
import 'package:flutter/material.dart';
import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/components/dropdown_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';

Widget names (Size size){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RoundedInputField(
        width: size.width * 0.45,
        stream: bloc.nameStream,
        onChanged: bloc.changeName,
        hintText: 'First',
        icon: Icons.add,
      ),
      RoundedInputField(
        width: size.width * 0.45,
        stream: bloc.name2Stream,
        onChanged: bloc.changeName2,
        hintText: ' Second',
        icon: Icons.add,
      ),
    ],
  );
}

Widget lastnames (Size size){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RoundedInputField(
        width: size.width * 0.45,
        stream: bloc.lastnameStream,
        onChanged: bloc.changeLastName,
        hintText: 'First',
        icon: Icons.add,
      ),
      RoundedInputField(
        width: size.width * 0.45,
        stream: bloc.lastname2Stream,
        onChanged: bloc.changeLastName2,
        hintText: ' Second',
        icon: Icons.add,
      ),
    ],
  );
}

Widget document(Size size){
  // to go further it should be loaded from server 
  List<String> _types = ['C.C','T.I','C.E'];
  bloc.changeDocType('C.C');
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      DropDownRounded(
        items: _types,
        // initialValue: bloc.docType,
        width: size.width * 0.25,
        stream: bloc.documentTypeStream,
        onChanged: bloc.changeDocType,
        kind: 'doc',
        icon: Icons.add,
      ),
      RoundedInputField(
        width: size.width * 0.65,
        stream: bloc.documentStream,
        onChanged: bloc.changeDoc,
        hintText: 'Document number',
        icon: Icons.account_circle,
      ),
    ],
  );
}

Widget events(Size size){
  // to go further it should be loaded from server 
  List<String> _types = ['Opera','Theater'];
  bloc.changeEvent('Opera');
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      DropDownRounded(
        items: _types,
        // initialValue: bloc.docType,
        kind: 'event',
        width: size.width * 0.8,
        stream: bloc.eventStream,
        onChanged: bloc.changeEvent,
        icon: Icons.event,
      ),
      
    ],
  );
}