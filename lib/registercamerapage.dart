import 'dart:async';

import 'package:camera/camera.dart';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'data.dart';
import 'registerfinalpage.dart';

class MyRegisterCameraPage extends StatefulWidget {
  const MyRegisterCameraPage({Key key}) : super(key: key);

  @override
  _RegisterCameraState createState() => _RegisterCameraState();
}

class _RegisterCameraState extends State<MyRegisterCameraPage> {
  Color mycol = Color(0xFF5CA9F0);

  List<CameraDescription> cameras;
  CameraController cameraController;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Widget _customText(String txt, double size) {
    return Text(txt,
        style: TextStyle(
            fontSize: size, color: Colors.white, fontFamily: 'Raleway'));
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      cameraController =
          new CameraController(cameras[0], ResolutionPreset.medium);
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  void setData(String path) {
    Data.imagePath = path;
  }

  Future navigateToRegisterFinalPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyRegisterFinalPage()));
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) return new Container();
    return Scaffold(
      backgroundColor: mycol,
      body: Stack(
        children: <Widget>[
          CameraPreview(cameraController),
          Container(
            alignment: Alignment.topCenter,
            child:
            Countdown(
              duration: Duration(seconds: 5),
              onFinish: () async {
                try {
                  await cameraController.initialize();
                  final path = join(
                      (await getTemporaryDirectory()).path,
                '${DateTime.now()}.png',
                );
                await cameraController.takePicture(path);
                setData(path);
                navigateToRegisterFinalPage(context);
                } catch (e) {
                print(e);
                }
              },
              builder: (BuildContext ctx, Duration remaining) {
                return  _customText('${remaining.inSeconds}', 72);
              },
            ),
          ),
        ],
      ),
    );
  }
}
