// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
class NeuButton extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(color: Colors.grey.shade400,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade700,
                offset: Offset(5,5),
                blurRadius: 15,
                spreadRadius: 1
            ),
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(-5,-5),
                blurRadius: 15,
                spreadRadius: 1
            )
          ],
//        gradient: LinearGradient(
//          begin: Alignment.topLeft,
//          end: Alignment.bottomRight,
//          colors: [
//            Colors.deepPurple.shade200,
//            Colors.deepPurple.shade400,
//          ],
//          stops: [
//            0.1,0.9,
//          ]
//        ),
      ),
    );
  }


}
