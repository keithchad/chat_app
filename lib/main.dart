import 'package:chat_app/helper/authenticate.dart';
import 'package:chat_app/pages/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Connect',
      theme: ThemeData(
        primaryColor: Color(0xFF145C9E),
        scaffoldBackgroundColor: Color(0xFF1F1F1F),
        primarySwatch: Colors.blue,
      ),
      home: Search(),
    );
  }
}
