import 'package:chat_app/helper/helperfunctions.dart';
import 'package:chat_app/pages/chatlist_screen.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  TextEditingController textPassword = new TextEditingController();
  TextEditingController textEmail = new TextEditingController();

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  QuerySnapshot querySnapshot;

  signIn() {
    if (formKey.currentState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(textEmail.text);

      setState(() {
        isLoading = true;
      });

      databaseMethods.getUserByEmail(textEmail.text).then((value) {
        querySnapshot = value;
        HelperFunctions.saveUserEmailSharedPreference(
            querySnapshot.docs[0].data()["name"]);
      });

      authMethods
          .signInWithEmailAndPassword(textEmail.text, textPassword.text)
          .then((value) {
        if (value != null) {
          HelperFunctions.saveUserLoggedInSharedPreference(true);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ChatList()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          return val.isEmpty
                              ? "Please provide a valid Email"
                              : null;
                        },
                        controller: textEmail,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration('Email'),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          return val.length > 6
                              ? null
                              : "Please provide a longer password";
                        },
                        controller: textPassword,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration('Password'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: simpleTextStyle(),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF007EF4),
                      Color(0xFF2A75BC),
                    ]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Sign In',
                    style: mediumTextStyle(),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Sign In with Google',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: mediumTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          ' Register Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
