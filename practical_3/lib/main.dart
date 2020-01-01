import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      title: "Toast in Specific Time",
      debugShowCheckedModeBanner: false,
      home: Practical3(),
    ));

class Practical3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "Timer Toast",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Toasting(),
    );
  }
}

class Toasting extends StatefulWidget {
  @override
  _ToastingState createState() => _ToastingState();
}

class _ToastingState extends State<Toasting> with WidgetsBindingObserver {
  int hrs = 0, mins = 0, sec = 0;
  var h = "00", m = "00", s = "00";

  void createToast() {
    Fluttertoast.showToast(
      msg: "10 Seconds Passed !!!!",
    );
  }

  void timerCall() {
    Timer.periodic(Duration(seconds: 10), (Timer t) => createToast());
    Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              sec++;
              mins += (sec ~/ 60);
              hrs += (mins ~/ 60);
              sec = sec % 60;
              mins = mins % 60;
              hrs = hrs % 60;
              h = hrs.toString().padLeft(2, '0');
              m = mins.toString().padLeft(2, '0');
              s = sec.toString().padLeft(2, '0');
            }));
  }

  @override
  void initState() {
    super.initState();
    timerCall();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "$h:$m:$s",
      style: TextStyle(fontFamily: "Times New Roman", fontSize: 50),
    ));
  }
}
