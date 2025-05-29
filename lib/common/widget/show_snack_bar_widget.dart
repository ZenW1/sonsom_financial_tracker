
import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';

class ShowSnackBarWidget {
  static showErrorSnackbarWidget(BuildContext context,{required String message}) {
       toastification.show(
         title: Text(message),
         autoCloseDuration: Duration(milliseconds: 1500),
         style: ToastificationStyle.minimal,
         type: ToastificationType.error,
           closeOnClick: true

       );
  }

  static showSuccessSnackbarWidget(BuildContext context,{required String message}) {
    toastification.show(
      title: Text(message),
      autoCloseDuration: Duration(milliseconds: 1000),
      style: ToastificationStyle.minimal,
      type: ToastificationType.success,
       closeOnClick: true,
    );
  }

  static showInfoSnackbarWidget(BuildContext context,{required String message}) {
    toastification.show(
      title: Text(message),
      autoCloseDuration: Duration(milliseconds: 1500),
      style: ToastificationStyle.minimal,
      type: ToastificationType.info,
      closeOnClick: true
    );
  }

}