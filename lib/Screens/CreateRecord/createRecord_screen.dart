import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/CreateRecord/components.dart/body.dart';
// import 'package:flutter_svg/svg.dart';



class CreateRecord extends StatefulWidget {
  @override
  _CreateRecordState createState() => _CreateRecordState();
}

class _CreateRecordState extends State<CreateRecord> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create record'),
        centerTitle: true,
        // actions: [
        //   SvgPicture.asset(
        //       "assets/icons/create.svg",
        //       height: size.height * 0.35,
        //     ),
        // ],
      
      ),
      body: Body(),
    );
  }
}