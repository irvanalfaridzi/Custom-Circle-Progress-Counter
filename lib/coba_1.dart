import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

class CircularAnimation1 extends StatefulWidget {
  @override
  _CircularAnimation1State createState() => _CircularAnimation1State();
}

class _CircularAnimation1State extends State<CircularAnimation1>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 6000,
        ),
        reverseDuration: Duration(seconds: 1),
        animationBehavior: AnimationBehavior.normal);

    _animation = Tween<double>(
      begin: 1000,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 24.0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularStepProgressIndicator(
                      totalSteps: 1000,
                      currentStep: 1000 - _animation.value.toInt(),
                      stepSize: 12,
                      selectedColor: Colors.grey,
                      unselectedColor: Color(0xffFC9A58),
                      width: 200,
                      height: 200,
                      padding: math.pi / 80,
                      selectedStepSize: 10.0,
                      // arcSize: math.pi * 2,
                      gradientColor: LinearGradient(
                          colors: [Color(0xffFC9A58), Color(0xA9D7399A)]),
                    ),
                  ],
                ),
              ),
              Text(
                'https//www.sandromaglione.com',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
