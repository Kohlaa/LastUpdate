//
// import 'package:flutter/material.dart';
//
//
// import '../CarDetailsNT/CarDetailsComponents/NT_containers.dart';
// import '../CarDetailsNT/CarDetailsComponents/Nt_cntainers2.dart';
// import '../CarDetailsNT/CarDetailsComponents/rate_system.dart';
//
//
// class CarDetailsContact extends StatelessWidget {
//   static const String routeName = "CarDetailsContact";
//
//   const CarDetailsContact({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 31),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30)),
//                     image: DecorationImage(
//                         fit: BoxFit.contain,
//                         image: AssetImage(
//                             "assets/images/unsplash_DXg6J5CaEcc.png"))),
//                 width: 390,
//                 height: 279,
//               ),
//               const SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 children: [
//                   const Text(
//                     "Mid Town Parker",
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                   const SizedBox(
//                     width: 99,
//                   ),
//                   Container(
//                     width: 69,
//                     height: 28,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(14),
//                       color: const Color.fromRGBO(25, 111, 213, 1),
//                     ),
//                     child: const Center(
//                         child: Text(
//                       "1 EGP/ hr",
//                       style: TextStyle(color: Colors.white),
//                     )),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 4,
//               ),
//               const Text(
//                 "5 min - 1.2 miles away",
//                 style: TextStyle(fontSize: 12),
//               ),
//               const SizedBox(
//                 height: 4,
//               ),
//               Row(
//                 children: const [
//                   Icon(Icons.star, color: Color.fromARGB(255, 250, 188, 3)),
//                   Text("4.3"),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15.5,
//               ),
//               Row(
//                 children: [
//                   buildDiscContainer(
//                       25,
//                       73.61,
//                       "2 gates",
//                       const Color.fromRGBO(238, 241, 244, 1),
//                       const Color.fromRGBO(25, 111, 213, 1)),
//                   const SizedBox(
//                     width: 7.85,
//                   ),
//                   buildDiscContainer(
//                       25,
//                       84.41,
//                       "4 Rounds",
//                       const Color.fromRGBO(238, 241, 244, 1),
//                       const Color.fromRGBO(25, 111, 213, 1)),
//                   const SizedBox(
//                     width: 7.85,
//                   ),
//                   buildDiscContainer(
//                       25,
//                       143.3,
//                       "100 Floor capacity",
//                       const Color.fromRGBO(238, 241, 244, 1),
//                       const Color.fromRGBO(25, 111, 213, 1)),
//                 ],
//               ),
//               const SizedBox(
//                 height: 13.5,
//               ),
//               buildDiscContainer(
//                   25,
//                   137.41,
//                   "400 Full capacity",
//                   const Color.fromRGBO(238, 241, 244, 1),
//                   const Color.fromRGBO(25, 111, 213, 1)),
//               const SizedBox(
//                 height: 21.5,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 58),
//                 child: Row(
//                   children: [
//                     buildDiscContainer(
//                         26,
//                         63,
//                         "Next To",
//                         const Color.fromRGBO(255, 255, 255, 1),
//                         const Color.fromRGBO(25, 111, 213, 1)),
//                     const SizedBox(
//                       width: 18,
//                     ),
//                     buildDiscContainer(
//                         26,
//                         89,
//                         "Describtion",
//                         const Color.fromRGBO(255, 255, 255, 1),
//                         const Color.fromRGBO(25, 111, 213, 1)),
//                     const SizedBox(
//                       width: 18,
//                     ),
//                     buildDiscContainer(
//                         26,
//                         87,
//                         "Contact us",
//                         const Color.fromRGBO(25, 111, 213, 1),
//                         const Color.fromRGBO(255, 255, 255, 1)),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: 370,
//                 height: 83.59,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(14),
//                     color: Colors.blue[400]),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 26.16),
//                   child: Column(
//                     children:  [
//                   Row(
//                   children: const [
//                   Icon(Icons.phone_outlined,color: Colors.white,),
//                   SizedBox(width: 8,),
//                   Text("+201052684628",style: TextStyle(color: Colors.white),),
//                   ],
//                   ),
//                   Row(
//                     children: const [
//                       Icon(Icons.alternate_email,color: Colors.white,),
//                       SizedBox(width: 12.94,),
//                       Text("Mid Town Park@gmail.com",style: TextStyle(color: Colors.white),),
//                     ],
//                   ),
//
//                   ]),
//                 ),
//               ),
//               const SizedBox(
//                 height: 111.41,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 74),
//                 child: Container(
//                   width: 241,
//                   height: 40,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(44),
//                       color: const Color.fromRGBO(238, 241, 244, 1)),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(14, 9, 12.5, 9),
//                         child: buildDiscContainer(
//                             22,
//                             70,
//                             "Rate us:",
//                             const Color.fromRGBO(25, 111, 213, 1),
//                             const Color.fromRGBO(255, 255, 255, 1)),
//                       ),
//                       iconrate(),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 18,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 38),
//                 child: Row(
//                   children: [
//                     ntcontainers2("poppins", FontWeight.w600),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       width: 150,
//                       height: 44,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(14),
//                           color: const Color.fromRGBO(25, 111, 213, 1)),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 15.5),
//                         child: Row(
//                           children: const [
//                             Icon(
//                               Icons.directions_run_sharp,
//                               color: Color.fromRGBO(255, 255, 255, 1),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             Center(
//                                 child: Text(
//                               "Direction",
//                               style: TextStyle(
//                                   color: Color.fromRGBO(255, 255, 255, 1),
//                                   fontFamily: 'poppins',
//                                   fontWeight: FontWeight.w600),
//                             )),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }