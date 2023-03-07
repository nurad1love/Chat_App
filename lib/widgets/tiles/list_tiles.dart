import 'package:flutter/material.dart';

class CustomListTile extends ListTile {
  @override
  // ignore: overridden_fields
  final Widget? leading;
  @override
  // ignore: overridden_fields
  final Widget? title;
  @override
  // ignore: overridden_fields
  final Function()? onTap;

  const CustomListTile(
      {super.key,
      required this.leading,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      onTap: onTap,
    );
  }
}
