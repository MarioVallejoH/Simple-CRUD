
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/providers/records.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showConfirmationDeleteAlert(BuildContext context, String msj, String id) {
  final size = MediaQuery.of(context).size;
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
                "assets/icons/remove.svg",
                height: size.height * 0.15,
              ),
          ),
          content: Text(
            msj,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              
              child: Text(
                'Yes',
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
              ),
                
              onPressed: () async{
                try {
                  loading(context);
                  Map res = await deleteRecord(id);
                  if(res['status']){
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    simpleAlert(context, 'Record deleted!','assets/icons/checked.svg');
                  }else{
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    simpleAlert(context, res['msg'],'assets/icons/error.svg');
                  }
                } catch (e) {
                  // must manage errors
                }
              },
            ),
            CupertinoDialogAction(
              child: Text(
                'No',
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
              ),
                
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}


void simpleAlert(BuildContext context, String msj, String img) {
  final size = MediaQuery.of(context).size;
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
                img,
                height: size.height * 0.15,
              ),
          ),
          content: Text(
            msj,
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            
            CupertinoDialogAction(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.black87),
                textAlign: TextAlign.center,
              ),
                
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}


void loading(BuildContext context, {String img:'assets/images/loading.gif' }) {
  final size = MediaQuery.of(context).size;
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
                img,
                height: size.height * 0.15,
              ),
          )
        );
      });
}



