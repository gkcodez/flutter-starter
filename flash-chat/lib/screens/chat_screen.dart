import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  Firestore _firestore = Firestore.instance;
  String message;
  TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      loggedInUser = await _auth.currentUser();
      print(loggedInUser.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _firestore
                      .collection('messages')
                      .getDocuments()
                      .then((snapshot) {
                    for (DocumentSnapshot ds in snapshot.documents) {
                      ds.reference.delete();
                    }
                  });
                });
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                }
                final messages = snapshot.data.documents;
                List<MessageBubble> messageWidgets = [];
                for (var message in messages) {
                  final messageText = message.data['text'];
                  final sender = message.data['sender'];
                  final messageWidget = MessageBubble(
                    messageText: messageText,
                    sender: sender,
                    isMe: loggedInUser.email == sender,
                  );
                  messageWidgets.add(messageWidget);
                }
                return Expanded(
                  child: ListView(reverse: true, children: messageWidgets),
                );
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      if (message != null) {
                        _textEditingController.clear();
                        try {
                          await _firestore.collection('messages').add({
                            'sender': loggedInUser.email,
                            'text': message,
                            'timestamp': DateTime.now(),
                          });
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    child: Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String sender;
  final bool isMe;
  MessageBubble(
      {@required this.messageText, @required this.sender, @required this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          SizedBox(height: 5),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
            elevation: 3,
            color: isMe ? Colors.lightBlueAccent : Colors.lightGreen,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                messageText,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
