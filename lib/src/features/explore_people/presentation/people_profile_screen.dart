// import 'package:eclipse_app/src/features/explore_people/domain/user.dart';
// import 'package:eclipse_app/src/themes/app_style.dart';
// import 'package:flutter/material.dart';
//
// class PeopleProfileScreen extends StatelessWidget {
//   const PeopleProfileScreen({Key? key}) : super(key: key);
//
//   static const String routeName = '/people-profile';
//
//   @override
//   Widget build(BuildContext context) {
//     late User user;
//     final data = ModalRoute.of(context)!.settings.arguments;
//     if (data != null) {
//       user = data as User;
//     }
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // ProfileDetailImageWidget(user: user),
//             AppSpace.vertical(30),
//             // PeopleIdentityWidget(user: user),
//             Container(
//               height: 80,
//               margin: const EdgeInsets.only(left: 24),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: dataHobbyDummy.length,
//                 itemBuilder: (context, index) {
//                   final hobby = dataHobbyDummy[index];
//                   return Container(
//                     width: 120,
//                     height: 80,
//                     margin: const EdgeInsets.only(right: 16),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(18),
//                       image: DecorationImage(
//                         image: AssetImage(hobby),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
//               child: CustomButtonWidget(title: 'Chat Now', onTap: () {}),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
