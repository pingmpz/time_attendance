import 'dart:io';

import 'package:flutter/material.dart';

import 'data.dart';
import 'registercamerapage.dart';
import 'homepage.dart';

/*
   !- NOTE
   Button - Size (300 x 60)
 */

class MyRegisterFinalPage extends StatelessWidget {
  final Color mycol = Color(0xFF5CA9F0);

  Widget _customText(String txt, double size) {
    return Text(txt,
        style: TextStyle(
            fontSize: size, color: Colors.white, fontFamily: 'Raleway'));
  }

  Widget _buildSpace_10() {
    return SizedBox(width: 10, height: 10);
  }

  Widget _buildSpace_40() {
    return SizedBox(width: 40, height: 40);
  }

  Future navigateToHomePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Future navigateToRegisterCameraPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyRegisterCameraPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycol,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _customText('Welcome', 50),
            _buildSpace_10(),
            Container(
              child: Image.file(File(Data.imagePath)),
            ),
            _buildSpace_10(),
            _customText('${Data.imagePath}', 12), // !- For testing only
            _buildSpace_10(),
            _customText('${Data.firstName} ${Data.lastName}', 32),
            _buildSpace_10(),
            _customText('${Data.occupation}', 18),
            _buildSpace_40(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ButtonTheme(
                      minWidth: 300,
                      height: 60,
                      child: RaisedButton(
                        onPressed: () {
                          navigateToHomePage(context);
                        },
                        color: Colors.green,
                        elevation: 0.0,
                        child: _customText('Finish', 32),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(45.0),
                            side: BorderSide(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                _buildSpace_40(),
                Column(
                  children: [
                    ButtonTheme(
                      minWidth: 300,
                      height: 60,
                      child: RaisedButton(
                        onPressed: () {
                          navigateToRegisterCameraPage(context);
                        },
                        color: Colors.deepOrange,
                        elevation: 0.0,
                        child: _customText('Retake', 32),
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
