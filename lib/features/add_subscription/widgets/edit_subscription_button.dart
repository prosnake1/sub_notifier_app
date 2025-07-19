// import 'package:flutter/material.dart';
// import 'package:sub_notifier_app/theme/theme.dart';

// class EditSubscriptionButton extends StatelessWidget {
//   const EditSubscriptionButton({
//     super.key,
//     required this.labelText,
//     required this.icon,
//     required this.onTap,
//   });
//   final String labelText;
//   final IconData icon;
//   final Function() onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           labelText,
//           style: Theme.of(context).textTheme.bodyLarge,
//         ),
//         InkWell(
//           onTap: onTap,
//           child: Container(
//             decoration: BoxDecoration(
//               color: (Theme.of(context).brightness == Brightness.dark)
//                   ? ThemeColors.textIconPrimaryExtraLow
//                   : ThemeColors.textIconExtraLow,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 40,
//                 vertical: 15,
//               ),
//               child: Center(
//                 child: Icon(
//                   icon,
//                   size: 30,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
