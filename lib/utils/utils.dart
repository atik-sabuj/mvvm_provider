import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
    backgroundColor: Colors.black,

    );
  }

  static void flushBarErrorMessage(String message, BuildContext context){

    showFlushbar(context: context,
    flushbar : Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(15),
      message : message,
      messageColor: Colors.black,
      duration: Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: Icon(Icons.error, size: 28, color: Colors.white,),

    )..show(context),

    );
  }

  static snackBar(String message, BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),)
    );
  }

}