import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:createworkouts/utils/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimeRest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(type: MaterialType.transparency, child: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(1),
              ),
              child: CircularCountDownTimer(
                // Countdown duration in Seconds
                duration: 60,

                // Width of the Countdown Widget
                width: MediaQuery.of(context).size.width / 2,

                // Height of the Countdown Widget
                height: MediaQuery.of(context).size.height / 2,

                // Default Color for Countdown Timer
                color: Colors.white.withOpacity(0.7),

                // Filling Color for Countdown Timer
                fillColor: Colors.red,

                // Border Thickness of the Countdown Circle
                strokeWidth: 7.0,

                // Text Style for Countdown Text
                textStyle: TextStyle(fontSize: 32.0, color: Colors.black87, fontWeight: FontWeight.bold),

                // true for reverse countdown (max to 0), false for forward countdown (0 to max)
                isReverse: true,

                // Function which will execute when the Countdown Ends
                onComplete: () {
                  // Here, do whatever you want
                  pop(context);
                },
              )),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
            icon: Icon(Icons.stop),
            label: Text("Stop"),
            onPressed: () {
              pop(context);
            },
          ),
        ],
      ),
    );
  }
}
