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

  const SectionScreen({Key? key, required this.id, required this.title}) : super(key: key);

  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  List<SectionDetailModel> _sectionDetails = [];
  late int countInt;
  final GlobalKey<AnimatedListState> _masterKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSectionDetailsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: firstBarColor,
        ),
        body: ListView.builder(
          itemCount: _sectionDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                duration: Duration(milliseconds: 375),
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ZikrCard(
                    itemIndex: _sectionDetails[index],
                    sectionIndex: _sectionDetails[index].sectionId,
                    reference: Text("${_sectionDetails[index].reference}"),
                    content: Text("${_sectionDetails[index].content}"),
                    description: Text("${_sectionDetails[index].description}"),
                    contentCount: _sectionDetails[index].count.toString(),
                    press: () {
                      setState(
                        () {
                          print(_sectionDetails[index].count);

                          if (_sectionDetails[index].count! > 1) {
                            _sectionDetails[index].count = _sectionDetails[index].count! - 1;
                            print(_sectionDetails[index].count);
                          } else {
                            _sectionDetails.removeAt(index);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          },
        )

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

  _loadSectionDetailsList() async {
    _sectionDetails = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/section_details_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionDetailModel sectionDetail = SectionDetailModel.fromJson(section);

        if (sectionDetail.sectionId == widget.id) {
          _sectionDetails.add(sectionDetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
