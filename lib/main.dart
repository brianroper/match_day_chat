import 'package:flutter/material.dart';
import 'package:match_day_chat/views/login_screen.dart';
import 'colors.dart';

final ThemeData _kMatchDayTheme = _buildTheme();

void main() => runApp(new MaterialApp(
      theme: _kMatchDayTheme,
      home: new LoginScreen(),
    ));

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kMatchDayBlue600,
    accentColor: kMatchDayRed900,
    buttonColor: kMatchDayBlue400,
    scaffoldBackgroundColor: kMatchDayBackgroundWhite,
    cardColor: kMatchDayBackgroundWhite,
    textSelectionColor: kMatchDayBlue200,
    errorColor: kMatchDayErrorRed,
    hintColor: kMatchDayBackgroundWhite,
    buttonTheme: new ButtonThemeData(textTheme: ButtonTextTheme.accent),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kMatchDayRed900,
        bodyColor: kMatchDayRed900,
      );
}
