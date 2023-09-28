// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tamen_qalbak/neu_button.dart';
import 'variables.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:confetti/confetti.dart';

class Mesbaha extends StatefulWidget {
  @override
  _MesbahaState createState() => _MesbahaState();
}

class _MesbahaState extends State<Mesbaha> {
  int num = 0;
  int dropdownValue = 100;
  bool isPlaying = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();

//    controller.play();

//    controller.addListener(() {setState(() {
//      isPlaying = controller.state == ConfettiControllerState.playing;
//    });});
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          backgroundColor: Colors.grey.shade400,
          appBar: AppBar(
            title: Center(
              child: Text(
                'المسبحة ',
                style: TextStyle(
                  fontFamily: 'Kufi',
                  fontSize: 30.0,
                ),
              ),
            ),
            backgroundColor: firstBarColor,
            actions: [
              //list if widget in appbar actions
              PopupMenuButton(
                icon: Icon(Icons.color_lens),
                color: firstBarColor,
                itemBuilder: (context) => [
                  PopupMenuItem<Widget>(
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: const Text('Blue'),
                      ),
                      onTap: () async {
                        return setState(() {
                          firstBarColor = Colors.blueAccent;
                          firstBGColor = Colors.blueAccent.shade200;
                        });
                      },
                    ),
                  ),
//
                  PopupMenuItem<Widget>(
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: const Text('Grey'),
                      ),
                      onTap: () {
                        return setState(() {
                          firstBarColor = Colors.blueGrey;
                          firstBGColor = Colors.blueGrey.shade200;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem<Widget>(
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: const Text('Purple'),
                      ),
                      onTap: () {
                        return setState(() {
                          firstBarColor = Colors.deepPurple;
                          firstBGColor = Colors.deepPurple.shade200;
                        });
                      },
                    ),
                  ),
                  PopupMenuItem<Widget>(
                    child: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: const Text('Teal'),
                      ),
                      onTap: () {
                        setState(() {
                          firstBarColor = Colors.teal;
                          firstBGColor = Colors.teal.shade200;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Column(
            //todo add background image as islamic pattern
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 3,
                  child: LiquidLinearProgressIndicator(
                    value: num / dropdownValue,
                    // Defaults to 0.5.
                    valueColor: AlwaysStoppedAnimation(
                        (num >= dropdownValue) ? Colors.pink : firstBGColor),
                    // Defaults to the current Theme's accentColor.
                    backgroundColor: Colors.grey.shade200,
                    // Defaults to the current Theme's backgroundColor.
                    borderColor: firstBarColor,
                    borderWidth: 5.0,
                    borderRadius: 12.0,
                    direction: Axis.vertical,
                    // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                    center: Text(
                      num.toString(),
                      style: TextStyle(
                        fontSize: 60.0,
                        color: Colors.black,
                      ),
                    ),
                  )),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15.0),
                          alignment: Alignment.centerLeft,
                          child: DropdownButton<int>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (int? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <int>[33, 100, 1000]
                                .map<DropdownMenuItem<int>>((totalNum) {
                              return DropdownMenuItem<int>(
                                value: totalNum,
                                child: Text(totalNum.toString()),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 230.0),
                          alignment: Alignment.centerRight,
                          child: RawMaterialButton(
                            onPressed: () {
                              setState(() {
                                num = 0;
                                controller.stop();
                              });
                            },
                            child: Icon(
                              FontAwesomeIcons.redo,
                              size: 25,
                              color: Colors.white,
                            ),
                            elevation: 2.0,
                            constraints: BoxConstraints.tightFor(
                                width: 56.0, height: 56.0),
                            shape: CircleBorder(),
                            fillColor: firstBarColor,
                          ),
//
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child:
//                       NeuButton()
                      RawMaterialButton(
                    onPressed: () {
//                 TODO Vibration.vibrate(duration: 1000);
                      setState(() {
                        num++;
                        HapticFeedback.heavyImpact();

                        if (num >= dropdownValue) {
                          controller.play();
                        } else {
                          controller.stop();
                        }
                      });
                    },
                    child: Icon(
                      FontAwesomeIcons.plus,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    elevation: 2.0,
                    constraints:
                        BoxConstraints.tightFor(width: 56.0, height: 56.0),
                    shape: CircleBorder(),
                    fillColor: firstBarColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirection: -pi / 2,
          emissionFrequency: 0.10,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 20,
          minBlastForce: 30,
          maxBlastForce: 100,
        ),
      ],
    );
  }
}
