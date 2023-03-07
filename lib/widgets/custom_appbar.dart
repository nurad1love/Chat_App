import 'package:flutter/material.dart';
import '../pages/settings/decorations/font_decoration.dart';

class CustomAppBar extends AppBar {
  final double? elevation;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Widget? title;
  final List<Widget>? actions;

  CustomAppBar({
    super.key,
    required this.elevation,
    required this.centerTitle,
    required this.backgroundColor,
    required this.title,
    required this.actions,
  });

  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      title: title,
      actions: actions,
    );
  }
}

final CustomAppBar kCustomAppBarForHomePage = CustomAppBar(
  elevation: 0.0,
  centerTitle: true,
  backgroundColor: Colors.indigo[900],
  title: Text(
    'Groups',
    style: kGoogleFontsMontserratWithBoldAndSize20,
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.search),
    ),
  ],
);

final CustomAppBar kCustomAppBarForProfilePage = CustomAppBar(
  elevation: 0.0,
  centerTitle: true,
  backgroundColor: Colors.blue[900],
  title: Text(
    'Profile',
    style: kGoogleFontsMontserratWithBoldAndSize20,
  ),
  actions: const [],
);
