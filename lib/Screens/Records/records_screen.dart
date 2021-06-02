import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Records/components/body.dart';


class RecordsScreen extends StatefulWidget {
  @override
  _RecordsScreenState createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Records'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}