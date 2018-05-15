import 'package:flutter/material.dart';
import 'package:match_day_chat/views/chat_cell.dart';
import 'package:match_day_chat/views/match_cell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:match_day_chat/views/login_screen.dart';
import 'colors.dart';

//void main() => runApp(new MatchDayChatApp());
void main() => runApp(new LoginScreen());

ThemeData _buildTheme() {
  return new ThemeData(
      primaryColor: kMatchDayBlue800,
      accentColor: kMatchDayRed900,
      buttonTheme: new ButtonThemeData(
          textTheme: ButtonTextTheme.accent
      )
  );
}