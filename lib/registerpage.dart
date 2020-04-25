import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage.dart';
import 'registercamerapage.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({ Key key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<MyRegisterPage> {

  Color mycol = Color(0xFF5CA9F0);
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: mycol,
      resizeToAvoidBottomPadding: false,
      
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // !- NOT WORKING
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(125.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Registeration',
                        style: TextStyle(
                            fontSize: 72,
                            color: Colors.white,
                            fontFamily: 'Raleway')),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('First Name',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'Raleway')),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            child: new TextField(
                              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z,A-Z]"))],
                              style: TextStyle(
                                  fontSize: 24,
                                  color: mycol,
                                  fontFamily: 'Raleway'),
                                decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('Last Name',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'Raleway')),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            child: new TextField(
                              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-z,A-Z]"))],
                              style: TextStyle(
                                  fontSize: 24,
                                  color: mycol,
                                  fontFamily: 'Raleway'),
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('Occupation',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'Raleway')),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            child: new TextField(
                              style: TextStyle(
                                  fontSize: 24,
                                  color: mycol,
                                  fontFamily: 'Raleway'),
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('Phone No.',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'Raleway')),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            child: new TextField(
                              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]")), LengthLimitingTextInputFormatter(10),],
                              controller: TextEditingController(),
                              //Allow TextFiled take in Numbers as default
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: mycol,
                                  fontFamily: 'Raleway'),
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.greenAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          const Text('Gender',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontFamily: 'Raleway')),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            width: 400,
                            height: 60,
                            child: ToggleButtons(
                              borderRadius: new BorderRadius.circular(45.0),
                              borderWidth: 10,
                              fillColor: Colors.blueAccent,
                              renderBorder: false,
                              children: <Widget>[
                                Container(
                                  width: 133,
                                  child: Center(
                                    child: const Text('Male',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontFamily: 'Raleway')),
                                  ),
                                ),
                                Container(
                                  width: 133,
                                  child: Center(
                                    child: const Text('Female',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontFamily: 'Raleway')),
                                  ),
                                ),
                                Container(
                                  width: 133,
                                  child: Center(
                                    child: const Text('Other',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontFamily: 'Raleway')),
                                  ),
                                ),
                              ],
                              onPressed: (int index) {
                                setState(() {
                                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                                    if (buttonIndex == index) {
                                      isSelected[buttonIndex] = true;
                                    } else {
                                      isSelected[buttonIndex] = false;
                                    }
                                  }
                                });
                              },
                              isSelected: isSelected,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [

                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ButtonTheme(
                          minWidth: 330,
                          height: 80,
                          child: RaisedButton(
                            onPressed: () {
                              navigateToRegisterCameraPage(context);
                            },
                            color: Colors.green,
                            elevation: 0.0,
                            child: const Text('Confirm',
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
                    SizedBox(width: 40),
                    Column(
                      children: [
                        ButtonTheme(
                          minWidth: 330,
                          height: 80,
                          child: RaisedButton(
                            onPressed: () {
                              navigateToHomePage(context);
                            },
                            color: Colors.red,
                            elevation: 0.0,
                            child: const Text('Cancel',
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future navigateToHomePage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyHomePage()));
}

Future navigateToRegisterCameraPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyRegisterCameraPage()));
}
