import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:flutter/material.dart';

import '../pages/auth/sign_in_page.dart';
import '../pages/settings/decorations/button_decorations/button_decoration.dart';
import 'widgets.dart';

class CustomButtons {
  late final ButtonStyle style;

  CustomButtons({required this.style});

  AuthService authService = AuthService();

  //Cancel button with pop context

  Widget toCancelButton(context) {
    return ElevatedButton(
      style: style,
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text(
        'Cancel',
      ),
    );
  }

  //button with navigator to login page

  Widget toNavigateButton(context) {
    return ElevatedButton(
      style: kButtonStyleWithColorRed,
      onPressed: () async {
        await authService.signOut().whenComplete(
          () {
            nextScreenReplace(
              context,
              const SignInPage(),
            );
          },
        );
      },
      child: const Text('Confirm'),
    );
  }

  // button for adding a new groups

  final groupName = "";

  Widget forAddingNewGroupsButton(context) {
    return ElevatedButton(
      style: style,
      onPressed: () {},
      child: const Text(
        'Create',
      ),
    );
  }
}
