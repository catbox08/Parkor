import 'package:flutter/material.dart';
import 'package:parkor/models/us.dart';
import 'package:parkor/utils/user_preferences.dart';
import 'package:parkor/widget/appbar_widget.dart';
import 'package:parkor/widget/profile_widget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // final user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //       appBar: buildAppBar(context),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           ProfileWidget(
//             imagePath: user.imagePath,
//             onClicked: () async {

//             },
//           ),
//           const SizedBox(height: 24),
//           buildName(user),
//           const SizedBox(height: 48),
//           buildAbout(user),
//         ],
//       ),
//     );
//   }

//   Widget buildName(User user) => Column(
//         children: [
//           Text(user.name,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
//           const SizedBox(height: 4),
//           Text(
//             user.email,
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       );
//   Widget buildAbout(User user) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'About',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               user.about,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),
        );
  }
}
//       appBar: buildAppBar(context),
//       body: ListView(
//         physics: BouncingScrollPhysics(),
//         children: [
//           ProfileWidget(
//             imagePath: user.imagePath,
//             onClicked: () async {

//             },
//           ),
//           const SizedBox(height: 24),
//           buildName(user),
//           const SizedBox(height: 48),
//           buildAbout(user),
//         ],
//       ),
//     );
//   }

//   Widget buildName(User user) => Column(
//         children: [
//           Text(user.name,
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
//           const SizedBox(height: 4),
//           Text(
//             user.email,
//             style: TextStyle(color: Colors.grey),
//           ),
//         ],
//       );
//   Widget buildAbout(User user) => Container(
//         padding: EdgeInsets.symmetric(horizontal: 48),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'About',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               user.about,
//               style: TextStyle(fontSize: 16, height: 1.4),
//             ),
//           ],
//         ),