import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData _buildTheme(){
  return new ThemeData(
    primaryColor: Color(0xFF007586),
    accentColor: Color(0xFF861200),
    buttonTheme: new ButtonThemeData(
      textTheme: ButtonTextTheme.accent
    )
  );
}