import 'package:flutter/material.dart';
import 'package:match_day_chat/views/match_cell.dart';

void main() => runApp(new MatchDayChatApp());

class MatchDayChatApp extends StatefulWidget {
  @override
  State createState() {
    return new MatchState();
  }
}

class MatchState extends State<MatchDayChatApp> {
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Match Day Chat"),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {
                  print("Refreshing list");
                  setState(() {
                    _isLoading = false;
                  });
                })
          ],
        ),
        body: new Center(
            child: _isLoading
                ? new CircularProgressIndicator()
                : new ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return new FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              new MaterialPageRoute(
                                  builder: (context) => new ChatScreen()
                              )
                          );
                        },
                        child: new MatchCell(),
                        padding: new EdgeInsets.all(0.0),
                      );
                    },
                  )),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() {
    return new ChatState();
  }
}

class ChatState extends State<ChatScreen> {
  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Match Chat Screen"),
        ),
        body: new Center(
          child: new Text("Chat will go here"),
        ),
      );
  }
}
