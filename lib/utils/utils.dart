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
      message : message,
    )
    );
  }

}