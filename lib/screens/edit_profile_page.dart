// import 'package:flutter/material.dart';
// import 'package:parkor/models/us.dart';
// import 'package:parkor/utils/user_preferences.dart';
// import 'package:parkor/widget/appbar_widget.dart';
// import 'package:parkor/widget/profile_widget.dart';
// import 'package:parkor/widget/textfield_widget.dart';

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({Key? key}) : super(key: key);

//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   User user = UserPreferences.myUser;
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: buildAppBar(context),
//         body: ListView(
//           padding: EdgeInsets.symmetric(horizontal: 32),
//           physics: BouncingScrollPhysics(),
//           children: [
//             ProfileWidget(
//                 imagePath: user.imagePath,
//                 isEdit: true,
//                 onClicked: () async {}),
//             const SizedBox(height: 24),
//             TextFieldWidget(
//               label: 'Full Name',
//               text: user.name,
//               onChanged: (name) {},
//             ),
//           ],
//         ),
//       );
// }
