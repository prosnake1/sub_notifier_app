// import 'package:flutter/material.dart';
// import 'package:sub_notifier_app/theme/theme_colors.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return Container(
//                   child: Text('Page'),
//                 );
//               },
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: ThemeColors.textIconExtraLow,
//               borderRadius: BorderRadius.circular(30),
//             ),
//             height: 200,
//             child: Column(
//               children: [
//                 ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   itemCount: 3,
//                   itemBuilder: (context, index) => Container(
//                     width: 15,
//                     height: 15,
//                     decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.circular(50)),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
