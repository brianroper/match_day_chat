import 'package:flutter/material.dart';

class MatchCell extends StatelessWidget {
  final awayTeam;
  final homeTeam;
  final awayLogo;
  final homeLogo;
  final kickOffTime;

  final logoSize = 40.0;

  MatchCell(this.awayTeam, this.homeTeam, this.awayLogo, this.homeLogo,
      this.kickOffTime);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.all(8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Image.network(homeLogo, height: logoSize, width: logoSize),
                new Text(homeTeam)
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.all(4.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Text(kickOffTime),
                new Text("Tommorow"),
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.all(8.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Image.network(awayLogo, height: logoSize, width: logoSize),
                new Text(awayTeam)
              ],
            ),
          ),
          new Divider()
        ],
      ),
    );
  }
}
