import 'package:flutter/material.dart';

import 'data.dart';
import 'registerpage.dart';

class MyHomePage extends StatelessWidget {

  Color mycol = Color(0xFF5CA9F0);

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
                child: const Text('Registeration',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontFamily: 'Raleway')),
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
                  // !- NAVIGATOR
                },
                color: mycol,
                elevation: 0.0,
                child: const Text('Identification',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontFamily: 'Raleway')),
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

Future navigateToRegisterPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyRegisterPage(data: new Data())));
}
