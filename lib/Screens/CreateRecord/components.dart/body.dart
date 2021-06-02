import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateRecord/components.dart/form.dart';

import 'package:flutter_auth/Screens/Welcome/components/background.dart';
// import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/components/rounded_button.dart';
// import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/providers/records.dart';
import 'package:flutter_auth/utils/alerts.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // names
            Center(
              child: Text(
                'Names',
                textScaleFactor: 1.3,
              ),
            ),
            Divider(),
            // SizedBox(height: size.height * 0.03),
            names(size),
            // lastnames
            Center(
              child: Text(
                'Lastnames',
                textScaleFactor: 1.3,
              ),
            ),
            Divider(),
            lastnames(size),
            //document
            Center(
              child: Text(
                'Document',
                textScaleFactor: 1.3,
              ),
            ),
            Divider(),
            document(size),
            // event
            Center(
              child: Text(
                'Event',
                textScaleFactor: 1.3,
              ),
            ),
            Divider(),
            events(size),

            RoundedButton(
              text: "CREATE",
              press: ()async {
                try {
                  loading(context);
                  Map res = await postRecord();
                  if(res['status']){
                    Navigator.of(context).pop();
                    Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
                    simpleAlert(context, 'Record created!','assets/icons/checked.svg');
                  }else{
                    Navigator.of(context).pop();
                    // Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
                    simpleAlert(context, res['msg'],'assets/icons/error.svg');
                  }
                } catch (e) {
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            
          ],
        ),
      ),
    );
  }
}