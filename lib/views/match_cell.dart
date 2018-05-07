import 'package:flutter/material.dart';

class MatchCell extends StatelessWidget {
  //final match;
  final _testUrl =
      "https://upload.wikimedia.org/wikipedia/en/thumb/5/51/New_York_Red_Bulls_logo.svg/1200px-New_York_Red_Bulls_logo.svg.png";

  //MatchCell(this.match);

  @override
  Widget build(BuildContext context) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new Image.network(_testUrl, height: 50.0),
              new Text("New York Red Bull")
            ],
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new Text("8:45 PM"),
              new Text("Tommorow"),
            ],
          ),
        ),
        new Container(
          padding: new EdgeInsets.all(16.0),
          child: new Column(
            children: <Widget>[
              new Image.network(_testUrl, height: 50.0),
              new Text("New York Red Bull")
            ],
          ),
        ),
        new Divider()
      ],
    );
  }
}
