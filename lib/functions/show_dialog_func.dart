import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:flutter/material.dart';
import '../widgets/confirm_alert_dialog.dart';

void showCheckDialog(
    {required bool barrierDismissible,
    required context,
    required AlertDialog Function(dynamic context) builder,
    required AuthService authService}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const CheckAlertDialog());
}

void showDialogForAddingNewGroup(
    {required bool barrierDismissible,
    required context,
    required AlertDialog Function(dynamic context) builder,
    required AuthService authService}) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => const DialogForAddingNewGroup());
}
