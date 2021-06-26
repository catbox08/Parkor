import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkor/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  Usname? _fromFirebaseUser(User user) {
    return user != null ? Usname(uid: user.uid) : null;
  }

  //Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _fromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email & password

  //register with email & password

  //sign out
}
