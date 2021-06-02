import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/providers/login.dart';
import 'package:flutter_auth/utils/alerts.dart';
// import 'package:flutter_auth/controllers/login.dart';
// import 'package:flutter_auth/providers/login.dart';
// import 'package:flutter_auth/providers/bloc.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool f = false;
  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
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
              text: "LOGIN",
              press: ()async {
                try {
                  loading(context);
                  Map info = await login();
                  if (info['status']) {
                    
                    // print(bloc.user.token);
                    Navigator.pop(context);
                    Navigator.pushNamedAndRemoveUntil(context,'home' , (route) => false);
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
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


}
