import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'match_cell.dart';

//Match Screen
class MatchDayChatApp extends StatefulWidget {
  @override
  State createState() {
    return new MatchScreenState();
  }
}

class MatchScreenState extends State<MatchDayChatApp> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Match Day Chat"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                print("Refreshing list");
                _buildMatchStream();
              })
        ],
      ),
      body: new Center(
          child:  _buildMatchStream()),
    );
  }

  Widget _buildMatchStream() {
    return new StreamBuilder(
        stream: Firestore.instance.collection('matches').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return new CircularProgressIndicator();
          return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemExtent: 115.0,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return new FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                new ChatScreen(ds.documentID)));
                  },
                  child: new MatchCell(
                      "${ds['awayTeam']}",
                      "${ds['homeTeam']}",
                      "${ds['awayLogo']}",
                      "${ds['homeLogo']}",
                      "${ds['kickOffTime']}"),
                  padding: new EdgeInsets.all(0.0),
                );
              });
        });
  }
}
