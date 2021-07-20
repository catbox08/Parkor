import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkor/screens/BlogComponent/Blogs.dart';
import 'package:parkor/screens/home.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({Key? key, }) : super(key: key);


  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 280,
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  child: Container(
                    padding: EdgeInsets.all(7),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Pargor Event 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Blogs()));
                  },
                )
              ],
            ),
          ),
        ),
        Container(
          height: 280,
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  child: Container(
                    padding: EdgeInsets.all(7),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Pargor Event 2",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Blogs()));
                  },
                )
              ],
            ),
          ),
        ),
        Container(
          height: 280,
          padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          width: MediaQuery.of(context).size.width,
          child: Card(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  child: Container(
                    padding: EdgeInsets.all(7),
                    height: 60,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Pargor Event 3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Blogs()));
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}