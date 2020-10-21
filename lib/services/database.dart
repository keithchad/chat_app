import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .where("userName", isEqualTo: username)
        .get();
  }

  getUserByEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .where("email", isEqualTo: email)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("Users").add(userMap);
  }

  createChatScreen(String chatID, chatMap) {
    FirebaseFirestore.instance
        .collection("ChatConversation")
        .doc(chatID)
        .set(chatMap)
        .catchError((e) {
      print(e);
    });
  }
}
