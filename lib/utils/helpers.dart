import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui_utils.dart';

class Helpers{

  static showToastMessage({String? message, backgroundColor, textColor}) {
    String mess = "";
    try {
      mess = jsonDecode(message!);
    } on FormatException {
      mess = message!;
    }
    Get.showSnackbar(GetSnackBar(
      messageText: Text(
        mess.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: backgroundColor ?? Colors.black.withOpacity(0.9),
      margin: const EdgeInsets.all(10),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      icon: Icon(
        Icons.error_outline,
        color: textColor ?? Colors.white,
      ),
    ));
  }



  static Future appConfirm(
      {required BuildContext? context, String? title, String? subTitle}) {
    return showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          // title: Text('$title'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Text(title,
                    style: const TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.w600)),
              vSpace,
              if (subTitle != null)
                Text(subTitle, style: const TextStyle(fontSize: 13.0)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            SizedBox(
                width: 1.0, child: Container(height: 30.0, color: Colors.grey)),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green,
              ),
              child: const Text("Yes"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
        );
      },
    );
  }


}