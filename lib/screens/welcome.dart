import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkor/screens/BlogComponent/AddBlog.dart';
import 'package:parkor/screens/BlogComponent/BlogCard.dart';
import 'package:parkor/screens/BlogComponent/Blogs.dart';
import 'package:parkor/screens/home.dart';
import 'package:parkor/screens/user.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }),
                );
              });
            },
            child: Text("Log out"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => addBlog()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: BlogCard(),
    );
  }
}
