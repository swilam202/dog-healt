import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future<void> customToast(String msg) async {
  await Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.red,
    gravity: ToastGravity.BOTTOM,
  );
}