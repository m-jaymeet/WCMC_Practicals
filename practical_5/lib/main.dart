import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  themeMode: ThemeMode.dark,
  debugShowCheckedModeBanner: false,
  home: Practical5(),
));

class Practical5 extends StatefulWidget {
  @override
  _Practical5State createState() => _Practical5State();
}

class _Practical5State extends State<Practical5> {
  final userController = TextEditingController(),
      passController = TextEditingController();
  String msg = "";
  Color bcolor;
  bool tVisible, buttonDisabled;
  int maxTries = 3;

  bool compare(u, v) {
    if (u.text == "admin" && v.text == "admin") {
      return true;
    }
    return false;
  }

  void checkIt(u, v) {
    if (compare(u, v)) {
      setState(() {
        msg = "Login Successful";
        bcolor = Colors.green;
        tVisible = true;
      });
    } else {
      setState(() {
        msg = "Wrong Credentials";
        bcolor = Colors.red;
        tVisible = true;
      });
      maxTries--;
      buttonDisabled = maxTries == 0 ? true : false;
    }
  }

  @override
  void initState() {
    super.initState();
    tVisible = false;
    buttonDisabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Practical 5",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: userController,
              decoration: InputDecoration(
                  hintText: "Username",
                  icon: Icon(
                    Icons.edit,
                    textDirection: TextDirection.ltr,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            TextField(
              obscureText: true,
              controller: passController,
              decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.security,
                    textDirection: TextDirection.ltr,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  child: RaisedButton(
                    onPressed: buttonDisabled
                        ? null
                        : () {
                      checkIt(userController, passController);
                    },
                    child: Text("Login"),
                  ),
                  padding: EdgeInsets.all(8.0),
                ),
                RaisedButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod("SystemNavigator.pop");
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
            Visibility(
              visible: tVisible,
              child: Text(
                msg,
                style: TextStyle(backgroundColor: bcolor, fontSize: 32.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}