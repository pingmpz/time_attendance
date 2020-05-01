import 'package:flutter/material.dart';

import 'identificationpage.dart';
import 'registerpage.dart';

/*
   !- NOTE
   Button - Size (360 x 80)
 */

class MyHomePage extends StatelessWidget {
  final Color mycol = Color(0xFF5CA9F0);

  Widget _customText(String txt, double size) {
    return Text(txt,
        style: TextStyle(
            fontSize: size, color: Colors.white, fontFamily: 'Raleway'));
  }

  Future navigateToRegisterPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyRegisterPage()));
  }

  Future navigateToIdentificationPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyIdentificationPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycol,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 360,
              height: 80,
              child: RaisedButton(
                onPressed: () {
                  navigateToRegisterPage(context);
                },
                color: mycol,
                elevation: 0.0,
                child: _customText('Registeration', 36),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(45.0),
                    side: BorderSide(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            ButtonTheme(
              minWidth: 360,
              height: 80,
              child: RaisedButton(
                onPressed: () {
                  navigateToIdentificationPage(context);
                },
                color: mycol,
                elevation: 0.0,
                child: _customText('Identification', 36),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(45.0),
                    side: BorderSide(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
