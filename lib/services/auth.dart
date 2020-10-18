import 'package:chat_app/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ignore: deprecated_member_use
  Users _userFromFirebase(FirebaseUser user) {
    return user != null ? Users(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // ignore: deprecated_member_use
      FirebaseUser firebaseUser = result.user;

      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toSTring());
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // ignore: deprecated_member_use
      FirebaseUser firebaseUser = result.user;

      return _userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toSTring());
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toSTring());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
