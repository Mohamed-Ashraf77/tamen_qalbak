// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../namesCards.dart';
import '../variables.dart';

class AlasmaaAlhosna extends StatefulWidget {
  @override
  _AlasmaaAlhosnaState createState() => _AlasmaaAlhosnaState();
}

class _AlasmaaAlhosnaState extends State<AlasmaaAlhosna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers:  [
          SliverAppBar(
            backgroundColor: firstBarColor,
            floating: true,
            expandedHeight: 80,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("اسماء الله الحسنى",
                style: TextStyle(
                fontFamily: 'Kufi',
                fontSize: 20.0,
              ),)
              ,
            ),
          ),
          SliverGrid(delegate: SliverChildBuilderDelegate(
              (context, index) {
                return InkWell(onTap: ()=>
                  showModalBottomSheet(context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      
                      builder: (context) => makeDismissible(
                        child: DraggableScrollableSheet(
                          initialChildSize: 0.7,
                          minChildSize: 0.5,
                          maxChildSize: 0.9,
                          builder: (_, controller)=>Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20),
                                ),
                            ),
                            padding: EdgeInsets.all(16),
                            child: ListView(
                              controller: controller,
                              children: [
                                Center(
                                    child: ClipRRect(borderRadius:BorderRadius.circular(20.0),
                                      child: Image.asset('images/asmaaHosna/asmaaHosna ($index).png',
                                        fit: BoxFit.fill,
                                      width: 250,
                                      height: 340,),
                                    )
                                ),
                                Center(
                                  child: Text('الاسماء الحسنى',style: TextStyle(
                                    fontFamily: 'Kufi',
                                    fontSize: 16.0,
                                  ),
                                  ),
                                ),

                                Center(
                                  child: ElevatedButton(
                                      onPressed: ()=> Navigator.of(context).pop(),
                                      child: Text("اغلاق",
                                        style: TextStyle(
                                        fontFamily: 'Kufi',

                                      ),),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),),

                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      gradient: RadialGradient(
                          colors: [
                            firstBarColor,
//                  Colors.green,
                            firstBGColor,
//                            firstBarColor
                          ],
                        tileMode: TileMode.mirror,),

                    ),
                    height: 350,
                    width: 250,
                    child: ClipRRect(
                      borderRadius:BorderRadius.circular(20.0),
                      child: Image.asset('images/asmaaHosna/asmaaHosna ($index).png',
                      fit: BoxFit.fill,
                        ),
                    ),
                  ),
                );

              },
          childCount: 99,
          ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2/3
            ),),
        ],
      ),
    );
  }
//  Widget buildSheet()=> Column(
//    children: [
//      Center(
//        child: ClipOval(
//          child: Image.asset('images/asmaaHosna/asmaaHosna ($index).png',
//            fit: BoxFit.cover,),
//        )
//      ),
//      Center(
//        child: Text('الاسماء الحسنى',
//          style: TextStyle(fontSize: 16),
//        ),
//      )
//    ],
//  );
Widget makeDismissible({required Widget child}) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: ()=> Navigator.of(context).pop(),
  child: GestureDetector(onTap: (){},child: child,),
);
}
