import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class MyIdentificationPage extends StatefulWidget {
  const MyIdentificationPage({Key key}) : super(key: key);

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<MyIdentificationPage> {
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

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      cameraController = new CameraController(cameras[0], ResolutionPreset.medium);
      await cameraController.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _isReady = true;
    });
  }

  Widget build(BuildContext context) {
    if (!_isReady) return new Container();
    return Scaffold(
      backgroundColor: mycol,
      body: Stack(
        children: <Widget>[
          CameraPreview(cameraController),
          Center(
            child: SlideCountdownClock(
              duration: Duration(seconds: 5),
              slideDirection: SlideDirection.Up,
              textStyle: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Colors.transparent,
              ),
              padding: EdgeInsets.all(10),
              onDone: () async {
                try {
                  await cameraController.initialize();
                  final path = join(
                      (await getTemporaryDirectory()).path,
                '${DateTime.now()}.png',
                );
                await cameraController.takePicture(path);
                  setState(() {
                    /*
                        // !- Database contact
                    */
                  });
                } catch (e) {
                print(e);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
