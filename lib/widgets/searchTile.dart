import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;

  SearchTile({this.userEmail, this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: mediumTextStyle()),
              Text(userEmail, style: mediumTextStyle()),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text("Message", style: mediumTextStyle()),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0)),
            ),
          ),
        ],
      ),
    );
  }
}
