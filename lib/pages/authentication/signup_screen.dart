import 'package:chat_app/pages/chatlist_screen.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  AuthMethods authMethods = new AuthMethods();

  TextEditingController textUserName = new TextEditingController();
  TextEditingController textEmail = new TextEditingController();
  TextEditingController textPassword = new TextEditingController();

  signUp() {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(textEmail.text, textPassword.text)
          .then((value) {
        //print("${value.uid}");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatList()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
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
                                return val.isEmpty || val.length < 2
                                    ? "Please provide a valid Username"
                                    : null;
                              },
                              controller: textUserName,
                              style: simpleTextStyle(),
                              decoration: textFieldInputDecoration('Username'),
                            ),
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
                      GestureDetector(
                        onTap: () {
                          //TODO
                        },
                        child: Container(
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
                      ),
                      SizedBox(height: 8.0),
                      GestureDetector(
                        onTap: () {
                          signUp();
                        },
                        child: Container(
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
                            'Sign Up',
                            style: mediumTextStyle(),
                          ),
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
                          'Sign Up with Google',
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
                            "ALready have an account? ",
                            style: mediumTextStyle(),
                          ),
                          Text(
                            ' SignIn Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              decoration: TextDecoration.underline,
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
