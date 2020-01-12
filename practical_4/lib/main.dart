import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Practical4(),
));

class Practical4 extends StatefulWidget {
  @override
  _Practical4State createState() => _Practical4State();
}

class _Practical4State extends State<Practical4> {
  double temp = 0;
  var final_temp = "";
  var msg = "Converted Temprature :";
  var show_msg = "";

  final controller1 = TextEditingController();

  double toC(double fahrenheit) {
    return ((fahrenheit - 32) * 5 / 9);
  }

  double toF(double celsius) {
    return ((celsius * 9) / 5) + 32;
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              "Temp Converter",
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: controller1,
            decoration: InputDecoration(
                hintText: "Enter Tempreature You Want to covert to",
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                )),
            onChanged: (String val) {},
          ),
          ButtonBar(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: Text("Convert to Celcius"),
                onPressed: () {
                  setState(() {
                    try {
                      if (controller1.text == "") {
                        show_msg = "";
                        return;
                      }
                      temp = double.parse(controller1.text);
                      final_temp = toC(temp).toString();
                      show_msg = msg + final_temp;
                    } catch (e) {
                      Fluttertoast.showToast(
                        msg: "NAN!! Enter a Valid Number",
                        toastLength: Toast.LENGTH_SHORT,
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("Convert to Fahrenheit"),
                onPressed: () {
                  setState(() {
                    try {
                      if (controller1.text == "") {
                        show_msg = "";
                        return;
                      }
                      temp = double.parse(controller1.text);
                      final_temp = toF(temp).toString();
                      show_msg = msg + final_temp;
                    } catch (e) {
                      Fluttertoast.showToast(
                        msg: "NAN!! Enter a Valid Number",
                        toastLength: Toast.LENGTH_SHORT,
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  });
                },
              )
            ],
          ),
          Text(
            "$show_msg",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    );
  }
}