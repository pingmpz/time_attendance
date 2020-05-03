import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'data.dart';
import 'dataForJson.dart';
import 'registercamerapage.dart';
import 'homepage.dart';

/*
   !- NOTE
   Button - Size (300 x 60)
 */

class MyRegisterFinalPage extends StatelessWidget {
  final Color mycol = Color(0xFF5CA9F0);
  final String link = '';

  Future<DataForJson> sendData() async {
    final http.Response response = await http.post(
      link, // !- Link ?
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstName': Data.firstName,
        'lastName' : Data.lastName,
        'occupation' : Data.occupation,
        'phoneNo' : Data.phoneNo,
        'imagePath' : Data.imagePath // !- Image ?
      }),
    );
    if (response.statusCode == 201) {
      return DataForJson.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

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
                          sendData();
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
