import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parkor/screens/BlogComponent/BlogCard.dart';
import 'package:parkor/screens/BlogComponent/BlogRegister.dart';
import 'package:parkor/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class Blogs extends StatefulWidget {
  const Blogs({Key? key, }) : super(key: key);


  @override
  _BlogsState createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  String numLike = "1";
  String _launchUrl = 'https://docs.google.com/forms/d/e/1FAIpQLSdbmRtIz5PTFWRHNDaI-20gPU-G8EAMl12PgBtZUOO0JK06OA/viewform';
  Future<void> _launchURL(String url) async {
    //const url = 'https://flutter.io';
    if (await canLaunch(url)) {
      await launch(url,forceSafariVC: false,forceWebView: false,
          headers: <String, String>{'header_key': 'header_value'});
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 340,
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 8,
              child: Column(
                children: [
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://www.seub.or.th/seubweb/wp-content/uploads/2019/07/%E0%B8%9B%E0%B8%A5%E0%B8%B9%E0%B8%81%E0%B8%9B%E0%B9%88%E0%B8%B2.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Text("ชมรมคนรักป่า",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.thumb_up,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          numLike,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Card(
              child: Column(
                children: [
                  new Text("เปลี่ยนอากาศบริสุทธิ์จากต้นไม้ฟอกอากาศห้องนอนไปเป็นอากาศตามธรรมชาติและลมทะเลกันที่บางปู กิจกรรมปลูกป่าที่เราจะได้ไปเรียนรู้ นวัตกรรม “ซีออส” (C-Aoss/CapsultArtoOcean Sediment System) ซึ่งเป็นนวัตกรรมโกงกางเที่ยวที่ผ่านการค้นคว้าและวิจัยมาแล้วว่าช่วยเร่งการตกตะกอนของป่าชายเลน ผลิตจากวัสดุเป็นมิตรกับสิ่งแวดล้อมและใช้ยางพาราเป็นส่วนผสมหลัก เราจะได้ไปร่วมปลูกป่าชายเลนโดยใช้โกงกางเทียม ไปเรียนรู้ระบบนิเวศป่าชายเลน และยังได้สนุกกับการปลูกป่าชายเลนกันแบบหนึ่งวันเต็มค่ะ "),
                  new Text(    "ระยะเวลารับสมัคร : รับสมัครถึงวันที่ 21 พ.ย. 2564 " ),
                  new Text(  "ช่องทางรับสมัคร : อาสาปลูกป่าชายเลน   "),
                  new Text(     "ค่าใช้จ่าย : 310 บาท"),
                  new RaisedButton(onPressed: (){
                    launch(_launchUrl);
                  },
                    child: new Text('Register Link'),
                  ),
                  new RaisedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisBlog()));
                  },
                    child: new Text('Register Page'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}