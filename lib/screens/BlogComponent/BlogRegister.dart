import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';


class RegisBlog extends StatefulWidget{
  const RegisBlog({Key? key,}):super(key: key);

  @override
  _RegisBlogState createState() => _RegisBlogState();
}

class _RegisBlogState extends State<RegisBlog>{
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _tel = TextEditingController();
  TextEditingController _email = TextEditingController();
  Widget _NameField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _name,
            decoration: InputDecoration(
              labelText: 'First Name',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please fill your Name';
              } else
                return null;
            },
            onSaved: (String? value) {
              _name = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }

  Widget _SurnameField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _surname,
            decoration: InputDecoration(
              labelText: 'Surname',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please fill your Surname';
              } else
                return null;
            },
            onSaved: (String? value) {
              _surname = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }
  Widget _TelField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _tel,
            decoration: InputDecoration(
              labelText: 'Tel',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please fill your Tel';
              } else
                return null;
            },
            onSaved: (String? value) {
              _tel = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }
  Widget _EmailField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _email,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please fill your Email';
              } else
                return null;
            },
            onSaved: (String? value) {
              _email = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  late Future<File> file;
  String status = '';
  String? base64Image;
  late File tmpFile;
  String errMessage = 'Error Uploading Image';

  late File _image;
  final picker = ImagePicker();
  Future _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    print(_image);
  }

  chooseImage() {
    setState(() {
      file = ImagePicker.platform.pickImage(source: ImageSource.gallery)
      as Future<File>;
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = file.toString();
    String? url;
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(await file);
    await uploadTask.whenComplete(() async => {
      url = await uploadTask.snapshot.ref.getDownloadURL()});


    FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    uid = auth.currentUser!.uid.toString();
    users.doc(uid).collection('AddRecipe').add({'imgURL': url});
    return url;
  }

  Widget _buildChooseImageField() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OutlineButton(
            onPressed: () async {
              _pickImage();
            },
            child: Text('Choose Image'),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
  static String? uid;
  Future<String> getUID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    String uid = auth.currentUser!.uid.toString();
    users.doc(uid).get();

    return uid;
  }

  @override
  void initState() {
    super.initState();
    getUID().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _NameField(),
            _SurnameField(),
            _TelField(),
            _EmailField(),
            _buildChooseImageField(),
            RaisedButton(
              color: Colors.green,
              child: Text(
                  'Register'
              ),
              onPressed: () async{
                uid = await getUID();
                CollectionReference ref = FirebaseFirestore.instance.collection('RegisterMember');
                String? url;
                if(_image != null) {
                  String fileName = uid! + DateTime
                      .now()
                      .microsecond
                      .toString();
                  Reference firebaseStorageRef =
                  FirebaseStorage.instance.ref().child('uploads/$fileName');
                  UploadTask uploadTask = firebaseStorageRef.putFile(_image);
                  await uploadTask.whenComplete(() async =>
                  {
                    print(uploadTask.snapshot.ref),
                    url = await uploadTask.snapshot.ref.getDownloadURL(),
                  });
                };
                ref.add({
                  'fname': _name.text,
                  'sname': _surname.text,
                  'tel': _tel.text,
                  'email': _email.text,
                  'imgUrl': url,
                }).whenComplete(() => Navigator.pop(context));
              },
            ),
          ],
        ),
      ),
    );
  }

}

