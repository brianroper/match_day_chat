import 'package:flutter/material.dart';
import 'package:match_day_chat/views/chat_cell.dart';
import 'package:match_day_chat/views/match_cell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(new MatchDayChatApp());

//Match Screen
class MatchDayChatApp extends StatefulWidget {
  @override
  State createState() {
    return new MatchScreenState();
  }
}

class MatchScreenState extends State<MatchDayChatApp> {
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
            : new StreamBuilder(
                stream: Firestore.instance.collection('matches').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text("Not data found");
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
                                    builder: (context) => new ChatScreen(ds.documentID)));
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
                }),
      ),
    ));
  }
}

StreamBuilder _getFireStoreChat(String key) {
  return new StreamBuilder(
      stream: Firestore.instance.collection('matches/' + key + "/chat").snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return CircularProgressIndicator();
        return new ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              return ChatCell("${ds['message']}");
            });
      });
}

//Chat Screen
class ChatScreen extends StatefulWidget {
  final String activeKey;

  ChatScreen(this.activeKey);

  @override
  State createState() {
    return new ChatScreenState(activeKey);
  }
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  var _isLoading = false;
  final TextEditingController _textController = new TextEditingController();
  final String activeKey;
  //  final List<ChatMessage> _messages = <ChatMessage>[];

  ChatScreenState(this.activeKey);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Match Chat Screen"),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
              child: _getFireStoreChat(activeKey)
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          )
        ],
      )
    );
  }

  //handled text entry
  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onSubmitted: _postMessage,
                    decoration: new InputDecoration.collapsed(
                        hintText: "Send a message"),
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                      icon: new Icon(Icons.send),
                      onPressed: () => _postMessage(_textController.text)),
                )
              ],
            )));
  }

  //sends message to cloud firestore
  void _postMessage(String text) {
    _textController.clear();
//    ChatMessage message = new ChatMessage(
//        text: text,
//        animationController: new AnimationController(
//            vsync: this, duration: new Duration(milliseconds: 300)));
//    setState(() {
//      _messages.insert(0, message);
//    });
//    message.animationController.forward();
  }

//  @override
//  void dispose() {
//    for (ChatMessage message in _messages)
//      message.animationController.dispose();
//    super.dispose();
//  }
}


//class ChatMessage extends StatelessWidget {
//  final String text;
//  final AnimationController animationController;
//
//  ChatMessage({this.text, this.animationController});
//
//  @override
//  Widget build(BuildContext context) {
//    return new SizeTransition(
//      sizeFactor: new CurvedAnimation(
//          parent: animationController, curve: Curves.easeInOut),
//      axisAlignment: 0.0,
//      child: new Container(
//        margin: const EdgeInsets.symmetric(vertical: 10.0),
//        child: new Row(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            new Container(
//              margin: const EdgeInsets.only(right: 16.0),
//              child: new CircleAvatar(child: new Text("U")),
//            ),
//            new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                new Text("Username", style: Theme.of(context).textTheme.subhead),
//                new Container(
//                  margin: const EdgeInsets.only(top: 5.0),
//                  child: new Text(text),
//                )
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
