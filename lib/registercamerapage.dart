import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'data.dart';
import 'registerfinalpage.dart';
import 'registerpage.dart';

class MyRegisterCameraPage extends StatefulWidget {
  final Data data;
  const MyRegisterCameraPage({Key key, this.data}) : super(key: key);

  @override
  _RegisterCameraState createState() => _RegisterCameraState();
}

class _RegisterCameraState extends State<MyRegisterCameraPage> {
  Color mycol = Color(0xFF5CA9F0);

  List<CameraDescription> cameras;
  CameraController controller;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() async {
      _isReady = true;
    });
  }

  void snap() async {
    try {
      await controller.initialize();
      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      await controller.takePicture(path);
      setData(path);
      navigateToRegisterFinalPage(context, widget.data);
    } catch (e) {
      print(e);
    }
  }

  Future setData(String path) async {
    widget.data.imagePath = path;
  }

  Widget build(BuildContext context) {
    if (!_isReady) return new Container();
    return Scaffold(
      backgroundColor: mycol,
      body: CameraPreview(controller),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await controller.initialize();
            final path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );
            await controller.takePicture(path);
            setData(path);
            navigateToRegisterFinalPage(context, widget.data);
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}

Future navigateToRegisterPage(context, data) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => MyRegisterPage(data: data)));
}

Future navigateToRegisterFinalPage(context, data) async {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => MyRegisterFinalPage(data)));
}
