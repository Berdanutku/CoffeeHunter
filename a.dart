

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/firstPage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(aApp());
}
class aApp extends StatelessWidget {


  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Coffee Hunter",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: firstPage(),
    );
  }
}