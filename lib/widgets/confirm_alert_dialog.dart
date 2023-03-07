import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:flutter/material.dart';
import '../pages/settings/decorations/button_decorations/button_decoration.dart';
import '../pages/settings/decorations/font_decoration.dart';
import '../pages/settings/decorations/text_field_decorations.dart';
import 'elevated_buttons.dart';

class CheckAlertDialog extends AlertDialog {
  const CheckAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService= AuthService();
    return AlertDialog(
      title: Text(
        'Log out',
        style: kGoogleFontsMontserratWithBoldAndSize18,
      ),
      content: const Text(
        'Are you really want to log out?',
      ),
      actions: [
        CustomButtons(style: kButtonStyleWithColorBlue).toCancelButton(context),
        CustomButtons(style: kButtonStyleWithColorRed).toNavigateButton(context),
      ],
    );
  }
}

class DialogForAddingNewGroup extends AlertDialog {
  const DialogForAddingNewGroup({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    const bool isLoading = false;

    return AlertDialog(
      title: Text(
        'Add new group!',
        style: kGoogleFontsMontserratWithBoldAndSize18,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isLoading == true ? const Center(child: CircularProgressIndicator(),) :
          TextFormField(
          validator: (val) {
            return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(val!)
                ? null
                : "This field is cannot be empty!";
          },

          decoration: kNewGroupFieldDecoration,
        ),
    ],
      ),
      actions: [
        CustomButtons(style: kButtonStyleWithColorRed).toCancelButton(context),
        CustomButtons(style: kButtonStyleWithColorBlue).forAddingNewGroupsButton(context),
      ],
    );
  }
}
