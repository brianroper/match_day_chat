import 'package:flutter/material.dart';
import 'package:match_day_chat/views/login_screen.dart';
import 'colors.dart';
import 'package:match_day_chat/models/category.dart';
import 'package:match_day_chat/views/menu_screen.dart';
import 'package:match_day_chat/views/backdrop.dart';
import 'package:match_day_chat/views/match_screen.dart';

final ThemeData _kMatchDayTheme = _buildTheme();

class App extends StatefulWidget {
  @override
  State createState() {
    return new AppState();
  }
}

class AppState extends State<App>{
  Category _currentCategory = Category.all;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: _kMatchDayTheme,
      home: Backdrop(
        currentCategory: Category.all,
        frontPanel: MatchScreen(),
        backPanel: Container(color: kMatchDayBlue600),
        frontTitle: Text('Matches'),
        backTitle: Text('Groups'),
      ),
    );
  }

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kMatchDayBlue600,
    accentColor: kMatchDayRed900,
    buttonColor: kMatchDayBlue400,
    scaffoldBackgroundColor: kMatchDaySurfaceBlack,
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
    bodyColor: Colors.white,
  );
}