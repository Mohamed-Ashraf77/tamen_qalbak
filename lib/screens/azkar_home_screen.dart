// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:tamen_qalbak/models/section_model.dart';
import 'package:tamen_qalbak/screens/section_detail_screen.dart';
import 'package:tamen_qalbak/screens/section_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../variables.dart';

class AzkarHomeScreen extends StatefulWidget {
  const AzkarHomeScreen({Key? key}) : super(key: key);

  @override
  _AzkarHomeScreenState createState() => _AzkarHomeScreenState();
}

class _AzkarHomeScreenState extends State<AzkarHomeScreen> {
  List<SectionModel> sections = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("أذكار المسلم"),
        backgroundColor: firstBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildSectionItem(model: sections[index]),
          itemCount: sections.length,
        ),
      ),
    );
  }

  Widget buildSectionItem({required SectionModel model}) {
    return InkWell(
      onTap: () {
       Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => SectionScreen(id: model.id!,title: model.name!,),),);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  firstBarColor,
//                  Colors.green,
                  firstBGColor,
                  firstBarColor
                ],
            ),
        ),
        child: Center(
            child: Text(
          "${model.name}",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  loadSections()  {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/sections_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
