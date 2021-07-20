import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';


class addBlog extends StatefulWidget{
  const addBlog({Key? key,}):super(key: key);

  @override
  _addBlogState createState() => _addBlogState();
}

class _addBlogState extends State<addBlog>{

  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _regisurl = TextEditingController();
  Widget _TitleField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _title,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please fill your Title';
              } else
                return null;
            },
            onSaved: (String? value) {
              _title = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }

  Widget _DescriptionField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _description,
            maxLines: 4,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please fill your description';
              } else
                return null;
            },
            onSaved: (String? value) {
              _description = value as TextEditingController;
            },
          )
        ],
      ),
    );
  }
  Widget _UrlField() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextFormField(
            controller: _regisurl,
            decoration: InputDecoration(
              labelText: 'Register Url',
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please fill your Register Link';
              } else
                return null;
            },
            onSaved: (String? value) {
              _title = value as TextEditingController;
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
            _TitleField(),
            _DescriptionField(),
            _UrlField(),
            _buildChooseImageField(),
            RaisedButton(
              color: Colors.green,
              child: Text(
                'Create Blog'
              ),
              onPressed: () async{
                uid = await getUID();
                CollectionReference ref = FirebaseFirestore.instance.collection('AddBlog');
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
                  'title': _title.text,
                  'description': _description.text,
                  'registerUrl': _regisurl.text,
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

