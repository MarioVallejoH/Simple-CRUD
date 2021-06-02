import 'package:flutter/material.dart';

import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/providers/records.dart';
import 'package:flutter_auth/utils/alerts.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO ATTENDANCE RECORD APP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/register.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LIST RECORDS",
              press: () async{
                loading(context);
                try {
                  Map info = await getRecords();
                  if(info['status']){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, 'records');
                  }else{
                    Navigator.pop(context);
                    simpleAlert(context, info['msg'],'assets/icons/error.svg');
                  }
                } catch (e) {
                  print(e);
                }
                
              },
            ),
            RoundedButton(
              text: "CREATE RECORD",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.pushNamed(context, 'createRecord');
              },
            ),
          ],
        ),
      ),
    );
  }
}