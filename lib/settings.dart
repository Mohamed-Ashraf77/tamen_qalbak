// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tamen_qalbak/variables.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstBGColor,
      appBar: AppBar(
          title: Center(
            child: Text(
              'الإعدادات',
              style: TextStyle(
                fontFamily: 'Kufi',
                fontSize: 30.0,
              ),
            ),
          ),
          backgroundColor: firstBarColor),
      body: Center(
        child: Text('SETTINGS'),
      ),
    );
  }
}
