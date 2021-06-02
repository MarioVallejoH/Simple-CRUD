import 'package:flutter/material.dart';

import 'package:flutter_auth/Screens/Welcome/components/background.dart';
import 'package:flutter_auth/bloc/bloc.dart';
import 'package:flutter_auth/components/record_card.dart';
import 'package:flutter_auth/providers/records.dart';

import 'package:shimmer/shimmer.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: StreamBuilder(
        stream: bloc.recordsStream ,
        // initialData: initialData ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return RefreshIndicator(
              onRefresh: ()async{
                
                try {
                  await getRecords();
        
                } catch (e) {
                }
              },
              child:ListView.builder(
                itemCount: bloc.records.total,
                itemBuilder: (BuildContext context, int index){
                  return RecordCard(record: bloc.records.records[index]);
                }
              )
            );
          }else{
            return RefreshIndicator(
              onRefresh: ()async{
                
                try {
                  await getRecords();
                  
                } catch (e) {
                }
              },
              child:ListView.builder(
                itemCount: 10,
                // Important code
                itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey[400],
                    highlightColor: Colors.white,
                    child: Container()
                ),
              )
            );

          }
          
        },
      ),
    );
  }
}