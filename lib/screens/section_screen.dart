// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:tamen_qalbak/models/section_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:tamen_qalbak/variables.dart';
import 'dart:convert';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../namesCards.dart';

class SectionScreen extends StatefulWidget {
  final int id;
  final String title;
  const SectionScreen({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  // var sectionDetails = [];
  List<SectionDetailModel> sectionDetails = [];
  late int countInt;
  final GlobalKey<AnimatedListState> _masterKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: firstBarColor,
      ),
      body:
      AnimationLimiter(
          child: ListView.builder(itemCount: sectionDetails.length,
            itemBuilder: (BuildContext context, int index) {

            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(duration: Duration(milliseconds: 3000),
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ZikrCard(
                            itemIndex: sectionDetails[index],
                            sectionIndex: sectionDetails[index].sectionId,
                            refrence: Text("${sectionDetails[index].reference}"),
                            content: Text("${sectionDetails[index].content}"),
                            description: Text("${sectionDetails[index].description}"),
                            contentCount: sectionDetails[index].count.toString(),
                            press: () {
                                      setState(
                                        () {
                                          print(sectionDetails[index].count);

                                          if (sectionDetails[index].count! > 1) {
                                            sectionDetails[index].count! -1;
                                            print(sectionDetails[index].count);
                                          } else {
                                            sectionDetails.removeAt(index);
                                          }
                                        },
                                      );
                            },
                          ),
                ),
              ),
            );
          },))

        // AnimatedList(initialItemCount:sectionDetails.length,
        //   itemBuilder: (BuildContext context, int index, Animation<double> animation) {
        //     return
          //         ZikrCard(
          //                 itemIndex: sectionDetails[index],
          //                 sectionIndex: sectionDetails[index].sectionId,
          //                 refrence: Text("${sectionDetails[index].reference}"),
          //                 content: Text("${sectionDetails[index].content}"),
          //                 description: Text("${sectionDetails[index].description}"),
          //                 contentCount: sectionDetails[index].count.toString(),
          //                 press: () {},
          //               );
          // } ,)
      // ListView.builder(
      //   itemCount: sectionDetails.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return
      //       ZikrCard(
      //               itemIndex: sectionDetails[index],
      //               sectionIndex: sectionDetails[index].sectionId,
      //               refrence: Text("${sectionDetails[index].reference}"),
      //               content: Text("${sectionDetails[index].content}"),
      //               description: Text("${sectionDetails[index].description}"),
      //               contentCount: sectionDetails[index].count.toString(),
      //               press: () {},
      //             );
      //   },
      // ),


      // AnimatedList(
      //   key: _masterKey,
      //   initialItemCount: sectionDetails.length,
      //   itemBuilder: (context, index, animation) => SlideTransition(
      //     position: animation.drive(Tween()),
      //     child:
      //     ZikrCard(
      //       itemIndex: sectionDetails[index],
      //       sectionIndex: sectionDetails[index].sectionId,
      //       refrence: Text("${sectionDetails[index].reference}"),
      //       content: Text("${sectionDetails[index].content}"),
      //       description: Text("${sectionDetails[index].description}"),
      //       contentCount: sectionDetails[index].count.toString(),
      //       press: () {
      //         setState(
      //           () {
      //             print(sectionDetails[index].count);
      //
      //             if (sectionDetails[index].count > 1) {
      //               sectionDetails[index].count--;
      //             } else {
      //               sectionDetails.removeAt(index);
      //             }
      //           },
      //         );
      //       },
      //     ),
      //   ),
      // ),
    );
  }

  loadSectionDetail() async {
    sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/section_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel sectionDetail =
            SectionDetailModel.fromJson(section);

        if (sectionDetail.sectionId == widget.id) {
          sectionDetails.add(sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
