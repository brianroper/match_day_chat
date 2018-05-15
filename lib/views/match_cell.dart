import 'package:flutter/material.dart';
import 'package:match_day_chat/colors.dart';

class MatchCell extends StatelessWidget {
  final awayTeam;
  final homeTeam;
  final awayLogo;
  final homeLogo;
  final kickOffTime;

  final logoSize = 50.0;
  final teamNameSize = 14.0;

  MatchCell(this.awayTeam, this.homeTeam, this.awayLogo, this.homeLogo,
      this.kickOffTime);

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: kMatchDaySurfaceGrey,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            width: 115.0,
            margin: new EdgeInsets.all(8.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Image.network(homeLogo, height: logoSize, width: logoSize),
                new Text(homeTeam, textAlign: TextAlign.center, style: new TextStyle(fontSize: teamNameSize),)
              ],
            ),
          ),
          new Container(
            width: 70.0,
            margin: new EdgeInsets.all(4.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("@" + kickOffTime),
                new Text("VS"),
              ],
            ),
          ),
          new Container(
            width: 115.0,
            margin: new EdgeInsets.all(8.0),
            child: new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.network(awayLogo, height: logoSize, width: logoSize),
                new Text(awayTeam, textAlign: TextAlign.center, style: new TextStyle(fontSize: teamNameSize),)
              ],
            ),
          ),
          new Divider()
        ],
      ),
    );
  }
}
