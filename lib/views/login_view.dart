import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  @override
  State createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginView>{
  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: _usernameController,
                  decoration: new InputDecoration(
                      hintText: "Username"
                  ),
                ),
                new TextField(
                  controller: _passwordController,
                  decoration: new InputDecoration(
                      hintText: "Username"
                  ),
                ),
                new MaterialButton(
                  onPressed: () => _loginWithCredentials(_usernameController.text, _passwordController.text),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _loginWithCredentials(String username, String password){

}

