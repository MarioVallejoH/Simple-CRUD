import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/bloc/bloc.dart';

import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/providers/singup.dart';
import 'package:flutter_auth/utils/alerts.dart';
import 'package:flutter_svg/svg.dart';

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
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/icons/contract.svg",
                height: size.height * 0.35,
              ),
            ),
            RoundedInputField(
              width: size.width * 0.8,
              hintText: "Your Name",
              stream: bloc.nameSingupStream,
              onChanged: bloc.changeNameSingup,
            ),
            RoundedInputField(
              width: size.width * 0.8,
              stream: bloc.emailStream,
              onChanged: bloc.changeEmail,
              hintText: 'Email',
            ),
            RoundedPasswordField(
              width: size.width * 0.8,
              onChanged: bloc.changePassword,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: ()async {
                try {
                  loading(context);
                  Map info = await singup();
                  if (info['status']) {
                    // print(bloc.user.token);
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context,'login' , (route) => false);
                    simpleAlert(context, 'User was registered successfully','assets/icons/checked.svg');
                    
                  }else{
                    Navigator.of(context).pop();
                    simpleAlert(context, info['msg'],'assets/icons/error.svg');
                  }
                } catch (e) {
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
