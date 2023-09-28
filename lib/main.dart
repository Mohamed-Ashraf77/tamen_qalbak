// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tamen_qalbak/screens/alasmaaAlhosna.dart';
import 'package:tamen_qalbak/settings.dart';
import 'package:tamen_qalbak/tamen_qalbak.dart';
import 'mesbaha.dart';
import 'variables.dart';
import 'screens/azkar_home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 2;
  final screens = [
    AzkarHomeScreen(),
    Mesbaha(),
    TamenQalbak(),
    AlasmaaAlhosna(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.blue,
//      appBar: AppBar(
//        title: Text('طمئن قلبك'),
//        centerTitle: true,
//      ),
      body:
//      IndexedStack(
//        index: index,
//        children: screens,
//      ),

      screens[index],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: firstBarColor,
          animationDuration: Duration(milliseconds: 300),
          buttonBackgroundColor: firstBGColor,
          index: index,
          height: 60,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          items: [
            Icon(
              Icons.airplay,
            ),
            Icon(
              Icons.add_circle,
            ),
            Icon(
              Icons.message,
            ),


            Icon(
              Icons.swap_horizontal_circle_rounded,
            ),
            Icon(
              Icons.settings,
            ),
          ],
        ),
      ),
    );
  }
}
