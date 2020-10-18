import 'package:chat_app/pages/authentication/signin_screen.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Connect',
          style: TextStyle(),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => SignIn()
              ));
            },
            child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Icon(Icons.exit_to_app)),
          ),
        ],
      ),
    );
  }
}
