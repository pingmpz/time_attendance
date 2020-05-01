import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage.dart';
import 'registercamerapage.dart';

import 'data.dart';

/*
   !- NOTE
   Button - Size (300 x 60)
   Toggle Button- Size ((MediaQuery.of(context).size.width - (marginSize * 2)) * 0.1 x 60)
 */

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<MyRegisterPage> {
  final Color mycol = Color(0xFF5CA9F0);
  final double marginSize = 100.0;
  final double boxHeight = 60.0;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  List<bool> isSelected = [true, false, false];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    occupationController.dispose();
    phoneNoController.dispose();
    super.dispose();
  }

  void setData() {
    Data.firstName = firstNameController.text;
    Data.lastName = lastNameController.text;
    Data.occupation = occupationController.text;
    Data.phoneNo = phoneNoController.text;
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i] == true) {
        Data.gender = i;
        break;
      }
    }
  }

  Widget _buildSpace() {
    return SizedBox(width: 40, height: 40);
  }

  Widget _customText(String txt, double size) {
    return Text(txt,
        style: TextStyle(
            fontSize: size, color: Colors.white, fontFamily: 'Raleway'));
  }

  TextStyle _customTextStyle(double size) {
    return TextStyle(fontSize: size, color: mycol, fontFamily: 'Raleway');
  }

  Future navigateToHomePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  Future navigateToRegisterCameraPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyRegisterCameraPage()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: mycol,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(marginSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _customText('Registeration', 60),
                    ],
                  ),
                  _buildSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _customText('First Name', 24),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            new TextField(
                              controller: firstNameController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp("[a-z,A-Z]"))
                              ],
                              style: _customTextStyle(24),
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
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _customText('Last Name', 24),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            new TextField(
                              controller: lastNameController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp("[a-z,A-Z]"))
                              ],
                              style: _customTextStyle(24),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _customText('Occupation', 24),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            new TextField(
                              controller: occupationController,
                              style: _customTextStyle(24),
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
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _customText('Phone No.', 24),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            new TextField(
                              controller: phoneNoController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp("[0-9]")),
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.number,
                              style: _customTextStyle(24),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  _buildSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _customText('Gender', 24),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              height: boxHeight,
                              child: ToggleButtons(
                                borderRadius: new BorderRadius.circular(45.0),
                                borderWidth: 10,
                                fillColor: Colors.blueAccent,
                                renderBorder: false,
                                children: <Widget>[
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            (marginSize * 2)) *
                                        0.1,
                                    child: Center(
                                      child: _customText('Male', 24),
                                    ),
                                  ),
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            (marginSize * 2)) *
                                        0.1,
                                    child: Center(
                                      child: _customText('Female', 24),
                                    ),
                                  ),
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            (marginSize * 2)) *
                                        0.1,
                                    child: Center(
                                      child: _customText('Other', 24),
                                    ),
                                  ),
                                ],
                                onPressed: (int index) {
                                  setState(() {
                                    for (int buttonIndex = 0;
                                        buttonIndex < isSelected.length;
                                        buttonIndex++) {
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
                          children: [],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [],
                        ),
                      ),
                    ],
                  ),
                  _buildSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          ButtonTheme(
                            height: 60,
                            minWidth: 300,
                            child: RaisedButton(
                              onPressed: () {
                                setData();
                                navigateToRegisterCameraPage(context);
                              },
                              color: Colors.green,
                              elevation: 0.0,
                              child: _customText('Confirm', 32),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  side: BorderSide(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      _buildSpace(),
                      Column(
                        children: [
                          ButtonTheme(
                            height: 60,
                            minWidth: 300,
                            child: RaisedButton(
                              onPressed: () {
                                navigateToHomePage(context);
                              },
                              color: Colors.red,
                              elevation: 0.0,
                              child: _customText('Cancel', 32),
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
      ),
    );
  }
}
