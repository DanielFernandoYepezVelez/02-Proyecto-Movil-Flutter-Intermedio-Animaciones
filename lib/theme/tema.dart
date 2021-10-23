import 'package:flutter/material.dart';

final tema = ThemeData.dark().copyWith(
  // accentColor: Colors.blue, (Deprecado)
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
);
