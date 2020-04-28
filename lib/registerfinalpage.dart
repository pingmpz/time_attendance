import 'package:flutter/material.dart';

import 'data.dart';
import 'registercamerapage.dart';
import 'homepage.dart';

class MyRegisterFinalPage extends StatelessWidget {
  Color mycol = Color(0xFF5CA9F0);
  int boxWidth = 300;
  int boxHeight = 60;

  Data data;

  MyRegisterFinalPage(Data data){
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycol,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 600,
                    child: data.image == null ? SizedBox(width: 10) : Image.file(data.image)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ButtonTheme(
                      height: boxHeight * 1.0,
                      minWidth: boxWidth * 1.0,
                      child: RaisedButton(
                        onPressed: () {
                          navigateToHomePage(context);
                        },
                        color: Colors.green,
                        elevation: 0.0,
                        child: const Text('Finish',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontFamily: 'Raleway')),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(45.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  children: [
                    ButtonTheme(
                      height: boxHeight * 1.0,
                      minWidth: boxWidth * 1.0,
                      child: RaisedButton(
                        onPressed: () {
                          navigateToRegisterCameraPage(context, data);
                        },
                        color: Colors.deepOrange,
                        elevation: 0.0,
                        child: const Text('Retake',
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontFamily: 'Raleway')),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(45.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future navigateToHomePage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyHomePage()));
}

Future navigateToRegisterCameraPage(context, data) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyRegisterCameraPage(data: data)));
}
