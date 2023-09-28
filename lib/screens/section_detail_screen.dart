// // ignore_for_file: prefer_const_constructors, avoid_print
//
// import 'package:tamen_qalbak/models/section_detail_model.dart';
// import 'package:flutter/material.dart';
// import 'package:tamen_qalbak/variables.dart';
// import 'dart:convert';
//
// import '../namesCards.dart';
//
// class SectionDetailScreen extends StatefulWidget {
//   final int id;
//   final String title;
//   const SectionDetailScreen({Key? key, required this.id, required this.title})
//       : super(key: key);
//
//   @override
//   _SectionDetailScreenState createState() => _SectionDetailScreenState();
// }
//
// class _SectionDetailScreenState extends State<SectionDetailScreen> {
//   var  sectionDetails = [];
//    late int countInt;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadSectionDetail();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         backgroundColor: firstBarColor,
//       ),
//       body:
//
//       Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ListView.separated(
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//
//               return
//                 Container(
//
//                 key: Key(sectionDetails[index].toString()),
//                 decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(.5),
//                     //todo   color:firstBGColor.withOpacity(.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   )
//                 ]),
//                 child:
//                 ZikrCard(
//                   itemIndex: sectionDetails[index],
//
//                   sectionIndex: sectionDetails[index].sectionId,
//                   refrence: Text(
//                     "${sectionDetails[index].reference}",
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(color: Colors.grey.shade400),
//                   ),
//                   content: Text(
//                     "${sectionDetails[index].content}",
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   description: Text(
//                     "${sectionDetails[index].description}",
//                     textDirection: TextDirection.rtl,
//                     style: TextStyle(
//                       fontSize: 16,
//                         color: Colors.grey.shade400,
//                      fontFamily: 'Kufi'
//                     ),
//                   ),
//
//                   contentCount:
//                   sectionDetails[index].count.toString(),
//
//
//                   press: () {
//
//                     setState(() {
//                       print(sectionDetails[index].count);
//
//                       if (sectionDetails[index].count >1) {
//                         sectionDetails[index].count-- ;
//                       } else {
//                         sectionDetails.removeAt(index);
//                       }
//                     });
//                   },
//                 ),
//
//               );
//             },
//             separatorBuilder: (context, index) => Divider(
//                   height: 1,
//                   color: Colors.grey.withOpacity(.8),
//                 ),
//             itemCount: sectionDetails.length),
//       ),
//     );
//   }
//
//   loadSectionDetail() async {
//     sectionDetails = [];
//     DefaultAssetBundle.of(context)
//         .loadString("assets/database/section_details_db.json")
//         .then((data) {
//       var response = json.decode(data);
//       response.forEach((section) {
//         SectionDetailModel _sectionDetail =
//             SectionDetailModel.fromJson(section);
//
//         if (_sectionDetail.sectionId == widget.id) {
//           sectionDetails.add(_sectionDetail);
//         }
//       });
//       setState(() {});
//     }).catchError((error) {
//       print(error);
//     });
//   }
// }
