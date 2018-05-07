import 'package:flutter/material.dart';

class MatchCell extends StatelessWidget {
  final awayTeam;
  final homeTeam;
  final awayTeamUrl;
  final homeTeamUrl;
  final kickOffTime;

  MatchCell(this.awayTeam, this.homeTeam, this.awayTeamUrl, this.homeTeamUrl,
      this.kickOffTime);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                new Image.network(homeTeamUrl, height: 35.0),
                new Text(homeTeam)
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(kickOffTime),
                new Text("Tommorow"),
              ],
            ),
          ),
          new Container(
            margin: new EdgeInsets.all(8.0),
            child: new Column(
              children: <Widget>[
                new Image.network(awayTeamUrl, height: 35.0),
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
