import 'package:flutter/material.dart';
import 'package:parkor/screens/edit_profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:parkor/screens/home.dart';
import 'package:parkor/utils/user_preferences.dart';
import 'package:parkor/screens/user.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      title: 'title',
      home: HomeScreen(),
    );
  }
}
