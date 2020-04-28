import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'homepage.dart';

Future<void> main() async {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]); // !- NOT WORKING
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}





