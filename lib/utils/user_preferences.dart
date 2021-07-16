import 'dart:convert';
import 'package:parkor/models/us.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://i1.wp.com/www.korseries.com/wp-content/uploads/2018/06/are-you-human-poster.jpg?fit=1000%2C596&ssl=1',
    name: 'Test bruh',
    email: 'test@gmail.com',
    about: 'dasdasdasdsadas',
    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
