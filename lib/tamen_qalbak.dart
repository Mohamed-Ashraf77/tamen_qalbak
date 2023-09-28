// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tamen_qalbak/variables.dart';

class TamenQalbak extends StatefulWidget {
  @override
  _TamenQalbakState createState() => _TamenQalbakState();
}

class _TamenQalbakState extends State<TamenQalbak> {
  var changeImage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstBGColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            'طمئن قلبك',
            style: TextStyle(
              fontFamily: 'Kufi',
              fontSize: 30.0,
            ),
          ),
        ),
        backgroundColor: firstBarColor),

      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    changeImage = Random().nextInt(21) + 1;
                  });
                },
                child: Image.asset('images/etmaan qalby ($changeImage).jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
