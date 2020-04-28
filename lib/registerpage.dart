import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data.dart';
import 'homepage.dart';
import 'registercamerapage.dart';

class MyRegisterPage extends StatefulWidget {
  final Data data;
  const MyRegisterPage({Key key, this.data}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<MyRegisterPage> {
  Color mycol = Color(0xFF5CA9F0);
  int boxWidth = 300;
  int boxHeight = 60;

  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController occupationController;
  TextEditingController phoneNoController;
  List<bool> isSelected = [true, false, false];
  bool prepared = false;

  @override
  void initState() {
    super.initState();
  }

  Future prepareData() async {
      if(prepared == false) {
        if (widget.data.ready == true) {
          firstNameController = TextEditingController(text: widget.data.firstName);
          lastNameController = TextEditingController(text: widget.data.lastName);
          occupationController = TextEditingController(text: widget.data.occupation);
          phoneNoController = TextEditingController(text: widget.data.phoneNo);
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = (i == widget.data.gender) ? true : false;
          }
          // !- CLEAR IMAGE ???
        } else {
          widget.data.ready = true;
          firstNameController = TextEditingController();
          lastNameController = TextEditingController();
          occupationController = TextEditingController();
          phoneNoController = TextEditingController();
          isSelected = [true, false, false];
        }
        prepared = true;
      }
  }

  Future setData() async {
    widget.data.firstName = firstNameController.text;
    widget.data.lastName = lastNameController.text;
    widget.data.occupation = occupationController.text;
    widget.data.phoneNo = phoneNoController.text;
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i] == true) {
        widget.data.gender = i;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    prepareData();
    return Scaffold(
      backgroundColor: mycol,
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // !- NOT WORKING (FOR CLEAR KEYBOARD)
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Registeration',
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontFamily: 'Raleway')),
                  ],
                ),
                SizedBox(height: 40),
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
                            height: boxHeight * 1.0,
                            width: boxWidth * 1.0,
                            child: new TextField(
                              controller: firstNameController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(
                                    RegExp("[a-z,A-Z]"))
                              ],
                              style: TextStyle(
                                  fontSize: 24,
                                  color: mycol,
                                  fontFamily: 'Raleway'),
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide:
                                      BorderSide(color: Colors.greenAccent),
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
                            height: boxHeight * 1.0,
                            width: boxWidth * 1.0,
                            child: new TextField(
                              controller: lastNameController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(
                                    RegExp("[a-z,A-Z]"))
                              ],
                              style: TextStyle(
                                  fontSize: 24,
                                  color: mycol,
                                  fontFamily: 'Raleway'),
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide:
                                      BorderSide(color: Colors.greenAccent),
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
                SizedBox(height: 40),
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
                            height: boxHeight * 1.0,
                            width: boxWidth * 1.0,
                            child: new TextField(
                              controller: occupationController,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: mycol,
                                  fontFamily: 'Raleway'),
                              decoration: new InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(45.0),
                                  borderSide:
                                      BorderSide(color: Colors.greenAccent),
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
                            height: boxHeight * 1.0,
                            width: boxWidth * 1.0,
                            child: new TextField(
                              controller: phoneNoController,
                              inputFormatters: [
                                WhitelistingTextInputFormatter(RegExp("[0-9]")),
                                LengthLimitingTextInputFormatter(10),
                              ],
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
                                  borderSide:
                                      BorderSide(color: Colors.greenAccent),
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
                SizedBox(height: 40),
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
                            height: boxHeight * 1.0,
                            width: boxWidth * 1.0,
                            child: ToggleButtons(
                              borderRadius: new BorderRadius.circular(45.0),
                              borderWidth: 10,
                              fillColor: Colors.blueAccent,
                              renderBorder: false,
                              children: <Widget>[
                                Container(
                                  width: 100,
                                  child: Center(
                                    child: const Text('Male',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontFamily: 'Raleway')),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: Center(
                                    child: const Text('Female',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontFamily: 'Raleway')),
                                  ),
                                ),
                                Container(
                                  width: 100,
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
                SizedBox(height: 40),
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
                              setData();
                              navigateToRegisterCameraPage(
                                  context, widget.data);
                            },
                            color: Colors.green,
                            elevation: 0.0,
                            child: const Text('Confirm',
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
                              navigateToHomePage(context);
                            },
                            color: Colors.red,
                            elevation: 0.0,
                            child: const Text('Cancel',
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
      context,
      MaterialPageRoute(
          builder: (context) => MyRegisterCameraPage(data: data)));
}
