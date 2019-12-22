import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Practical2(),
    ));

class Practical2 extends StatefulWidget {
  @override
  _Practical2State createState() => _Practical2State();
}

class _Practical2State extends State<Practical2> {
  final myController1 = TextEditingController(),
      myController2 = TextEditingController(),
      myFocusNode1 = FocusNode(),
      myFocusNode2 = FocusNode();

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  var val1, val2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Practical 2",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.red,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text(
              "Add 2 Numbers",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 48.0, color: Colors.white),
            )),
            TextField(
              controller: myController1,
              focusNode: myFocusNode1,
              decoration: InputDecoration(
                  hintText: "Enter Number 1",
//                  fillColor: Colors.white,
                  icon: Icon(Icons.edit, color: Colors.white)),
            ),
            TextField(
              controller: myController2,
              focusNode: myFocusNode2,
              decoration: InputDecoration(
                  hintText: "Enter Number 2",
                  fillColor: Colors.white,
                  icon: Icon(Icons.edit, color: Colors.white)),
            ),
            RaisedButton(
                child: Text(
                  "Add",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                onPressed: () {
                  print(myController1.text+" "+myController2.text);
                  setState(() {
                    val1 = myController1.text;
                    val2 = myController2.text;
                  });
                  print("hiiii");
                  print(val1+" "+val2);
                  try {
                    val1 = int.parse(val1);
                  } catch (e) {
                    Fluttertoast.showToast(msg: "NAN!! Enter a Valid Number",
                      toastLength: Toast.LENGTH_SHORT,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      fontSize: 16.0,
                    );
                    FocusScope.of(context).requestFocus(myFocusNode1);
                    return ;
                  }
                  try {
                    val2 = int.parse(val2);
                  } catch (e) {
                    Fluttertoast.showToast(msg: "NAN!! Enter a Valid Number",
                      toastLength: Toast.LENGTH_SHORT,
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      fontSize: 16.0,
                    );
                    FocusScope.of(context).requestFocus(myFocusNode2);
                    return ;
                  }
                  var ans=val1+val2;
                  Fluttertoast.showToast(msg: "The Sum is "+ans.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    textColor: Colors.black,
                    backgroundColor: Colors.white,
                    fontSize: 16.0,
                  );
                })
          ]),
    );
  }
}
