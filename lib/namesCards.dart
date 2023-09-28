// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamen_qalbak/variables.dart';
import 'package:tamen_qalbak/models/section_detail_model.dart';
import 'screens/section_detail_screen.dart';

class ZikrCard extends StatelessWidget {
  const ZikrCard({
    Key? key,
    required this.sectionIndex,
//    this.product,
    required this.press,
    required this.content,
    required this.contentCount,
    required this.itemIndex,
    this.reference,
    this.description,
  }) : super(key: key);

  final int? sectionIndex;
  final dynamic itemIndex;

//  final Product product;
  final Function() press;
  final Text content;
  final contentCount;
  final Text? reference;

  final Text? description;

  @override
  Widget build(BuildContext context) {
    // It  will provide us total height and width of our screen
    Size size = MediaQuery.of(context).size;

    return Container(
      key: Key(itemIndex.toString()),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          //todo   color:firstBGColor.withOpacity(.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ]),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          vertical: kDefaultPadding / 2,
        ),
        // color: Colors.blueAccent,
//      height: 160,
        child: InkWell(
          onTap: press,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              // Those are our background
              Container(
                width: double.infinity,
//              height: 136,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: sectionIndex!.isEven ? firstBGColor : firstBarColor,
                  boxShadow: const [kDefaultShadow],
                ),
                child: Container(
                  width: double.infinity,
//                height: double.infinity,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SizedBox(
//                  height: 136,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          content!, description!, reference!,
//                       Text(
//                       refrence!,
//                         textDirection: TextDirection.rtl,
//                         style: TextStyle(color: Colors.grey.shade400),
//                       ),
//
//                           Text(
//                             content!,
//                             textDirection: TextDirection.rtl,
//                             style: TextStyle(
//                               fontSize: 20,
//                             ),
//                           ),
//                           Text(
//                             description!,
//                             textDirection: TextDirection.rtl,
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.grey.shade400,
// //                      fontFamily: 'Kufi'
//                             ),
//                           ),
//                        Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),
                            ),
                            child: Text(
                              contentCount,
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // our product image
            ],
          ),
        ),
      ),
    );
  }
}
