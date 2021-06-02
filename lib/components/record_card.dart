import 'package:flutter/material.dart';

import 'package:flutter_auth/models/records.dart';
import 'package:flutter_auth/utils/alerts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecordCard extends StatelessWidget {
  final String hintText;

  final Record record;
  const RecordCard({
    Key key,
    this.hintText,
    this.record
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        width: size.width*0.9,
        height: size.height*0.1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
              
                "assets/icons/reserva.svg",
                width: size.width*0.12,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width*0.5,
                  child:Text(
                    record.firstname + ' ' + record.secondname + ' ' 
                    + record.firstlastname + ' ' + record.secondlastname,
                    
                  ),
                ),
                Divider(),
                Container(
                  width: size.width*0.5,
                  child:Text(
                    record.documentType + ' : ' + record.document,
                    
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // width: size.width*0.,
                  child:Text(
                    record.eventType,
                    
                  ),
                ),
                Divider(),
                Container(
                  // width: size.width*0.1,
                  child:Text(
                    record.date,
                    
                  ),
                ),
              ],
            ),
            
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                
                  "assets/icons/delete.svg",
                  width: size.width*0.095,
                ),
              ),
              onTap: (){
                showConfirmationDeleteAlert(
                  context, 
                  'Are you sure to delete this record?',
                  record.id 
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}