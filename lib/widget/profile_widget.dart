// import 'dart:js';

// import 'package:flutter/material.dart';
// import 'package:parkor/models/us.dart';
// import 'package:parkor/screens/edit_profile_page.dart';

// class ProfileWidget extends StatelessWidget {
//   final String imagePath;
//   final bool isEdit;
//   final VoidCallback onClicked;
//   const ProfileWidget(
//       {Key? key,
//       required this.imagePath,
//       required this.onClicked,
//       this.isEdit = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final color = Theme.of(context).colorScheme.primary;
//     return Center(
//       child: Stack(
//         children: [
//           buildImage(),
//           Positioned(
//             bottom: 0,
//             right: 4,
//             child: buildEditIcon(color),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildImage() {
//     final image = NetworkImage(imagePath);

//     return ClipOval(
//       child: Material(
//         color: Colors.transparent,
//         child: Ink.image(
//           image: image,
//           fit: BoxFit.cover,
//           width: 128,
//           height: 128,
//           child: InkWell(onTap: onClicked),
//         ),
//       ),
//     );
//   }

//   Widget buildEditIcon(Color color) => buildCircle(
//         color: Colors.white,
//         all: 3,
//         child: buildCircle(
//           color: color,
//           all: 8,
//           child: IconButton(
//             icon: Icon(
//               isEdit ? Icons.add_a_photo : Icons.edit,
//               color: Colors.white,
//               size: 20,
//             ),
//             onPressed: () {
//               Navigator.push(context, route)(
//                 context,
//                 MaterialPageRoute(builder: (context) {
//                   return EditProfilePage();
//                 }),
//               );
//             },
//           ),
//         ),
//       );
//   Widget buildCircle({
//     required Widget child,
//     required double all,
//     required Color color,
//   }) =>
//       ClipOval(
//         child: Container(
//           padding: EdgeInsets.all(all),
//           color: color,
//           child: child,
//         ),
//       );
// }
