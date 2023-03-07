import 'package:flutter/material.dart';

final MaterialStateProperty<Color?> kMaterialStateColorWithColorBlue = MaterialStateColor.resolveWith(
      (states) => const Color(0xFF1A237E),
);

final MaterialStateProperty<Color?> kMaterialStateColorWithColorsRed = MaterialStateColor.resolveWith(
      (states) => Colors.red,
);