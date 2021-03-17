import 'package:flutter/material.dart';
import 'package:resilient/constants/fonts.dart';

//
// class DonationButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.green
//               ),
//               height: MediaQuery.of(context).size.height/3.28,
//               width: MediaQuery.of(context).size.height/3.28
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height/3.28,
//               width: MediaQuery.of(context).size.height/3.28,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.yellow
//               )
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

Container  container(BuildContext context, Color color, String text) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: color
          )
      ),
      height: MediaQuery.of(context).size.height/4.28,
      width: MediaQuery.of(context).size.height/4.28,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: FontConstants.NUNITOSANS
          ),
          textAlign: TextAlign.center,
        ),
      ),
  );
}