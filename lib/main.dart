import 'package:flutter/material.dart';

import 'package:parkor/screens/home.dart';
import 'package:parkor/screens/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
