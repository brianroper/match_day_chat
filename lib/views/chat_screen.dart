import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'chat_cell.dart';

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
  ScrollController _scrollController;

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

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );
  }

  void _toEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
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
  void _postMessage(String message) {
    Firestore.instance.collection('matches/' + activeKey + '/chat').document()
        .setData(newMessage(message)).whenComplete((){
      _textController.clear();
      _toEnd();
    }).catchError((e) => print(e));
  }

  Map<String, String> newMessage(String message){
    Map<String, String> data = <String, String>{
      "username": "test1234",
      "message": message,
      "timestamp": "12334556789"
      //TODO: get true values ^
    };
    return data;
  }

  StreamBuilder _getFireStoreChat(String key) {
    return new StreamBuilder(
        stream: Firestore.instance.collection('matches/' + key + "/chat").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return CircularProgressIndicator();
          return new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              itemCount: snapshot.data.documents.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.documents[index];
                return ChatCell("${ds['message']}", "${ds['username']}", "${ds['timestamp']}");
              });
        });
  }
}