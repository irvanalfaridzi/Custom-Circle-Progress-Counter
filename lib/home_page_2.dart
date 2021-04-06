import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class HomePageDua extends StatefulWidget {
  @override
  _HomePageDuaState createState() => _HomePageDuaState();
}

class _HomePageDuaState extends State<HomePageDua> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: const Color(0xfff9f3e3),
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              title: Text("Kick Counter"),
              backgroundColor: const Color(0xffFF6080),
            ),
            body: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/images/center.png",
                      height: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Center(
                    child: CircularStepProgressIndicator(
                      totalSteps: 12,
                      currentStep: 8,
                      stepSize: 18,
                      selectedColor: Colors.blue,
                      unselectedColor: Colors.purple[400],
                      padding: math.pi / 80,
                      width: MediaQuery.of(context).size.width - (24 * 2),
                      height: MediaQuery.of(context).size.width - (24 * 2),
                      startingAngle: -math.pi * 2 / 3,
                      arcSize: math.pi * 2,
                      gradientColor: LinearGradient(
                        colors: [Color(0xffFC9A58), Color(0xffD7399A)],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

Widget circleContainer({Color color = Colors.white, double size = 40}) {
  return Container(
      alignment: Alignment.center,
      child: InkWell(
          child: new Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(
            20.0), //I used some padding without fixed width and height
        decoration: new BoxDecoration(
          shape: BoxShape
              .circle, // You can use like this way or like the below line
          //                borderRadius: new BorderRadius.circular(30.0),
          color: color,
        ),
        child: new Text("",
            style: new TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold)),
        alignment: Alignment.center,
// You can add a Icon instead of text also, like below.
//child: new Icon(Icons.arrow_forward, size: 50.0, color: Colors.black38)),
      )));
}
