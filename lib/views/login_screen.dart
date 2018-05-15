import 'package:flutter/material.dart';
import 'package:match_day_chat/colors.dart';

final ThemeData _kMatchDayTheme = _buildTheme();

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: _kMatchDayTheme,
      home: new Scaffold(
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage("assets/soccer_field_dark.jpg"),
                fit: BoxFit.cover,
              )),
            ),
            SafeArea(
              child: new Card(
                color: kMatchDaySurfaceTrans,
                margin: EdgeInsets.only(
                    left: 32.0, right: 32.0, top: 165.0, bottom: 165.0),
                child: new Container(
                  alignment: Alignment.center,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      _buildLogo(),
                      SizedBox(height: 12.0),
                      _buildTextField("Username", _usernameController, false),
                      SizedBox(height: 12.0),
                      _buildTextField("Password", _passwordController, true),
                      _buildLoginButton("Login"),
                      SizedBox(height: 12.0),
                      _buildSignUp(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isPassword) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
      ),
      style: new TextStyle(color: Colors.white),
    );
  }

  Widget _buildLoginButton(String label) {
    return new Container(
      margin: EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text(label),
        elevation: 8.0,
        padding: EdgeInsets.all(16.0),
        onPressed: () {
          _loginWithCredentials(
              _usernameController.text, _passwordController.text);
        },
      ),
    );
  }

  Widget _buildLogo() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Image.asset('assets/soccer_icon.png',
            width: 100.0, height: 100.0, fit: BoxFit.cover),
        new Text("Matchday Chat",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.white))
      ],
    );
  }

  Widget _buildSignUp() {
    return new Text("Need an account? Sign up here",
        textAlign: TextAlign.center,
        style: new TextStyle(fontSize: 14.0, color: Colors.white));
  }

  void _loginWithCredentials(String username, String password) {
    Navigator.pop(context);
  }
}

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
