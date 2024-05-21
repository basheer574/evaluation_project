import 'package:camera/camera.dart';
import 'package:evaluation_project/main.dart';
import 'package:evaluation_project/screens/home_screen.dart';
import 'package:evaluation_project/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class FaceDetection extends StatefulWidget {
  const FaceDetection({super.key});

  @override
  State<FaceDetection> createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  CameraImage? cameraImage;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    loadModel();
    loadCamera();
  }

  //Load Camera
  void loadCamera() async {
    cameraController = CameraController(cameras.first, ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

  //Build the model
  void runModel() async {
    if (cameraImage != null) {
      var predictions = await Tflite.runModelOnFrame(
          bytesList: cameraImage!.planes.map((plane) {
            return plane.bytes;
          }).toList(),
          imageHeight: cameraImage!.height,
          imageWidth: cameraImage!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true);
      //Check Element with model value if equal, navigate to HomeScreen
      for (var element in predictions!) {
        if (element["label"].toString() == "3 Move Closer") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      }
    }
  }

  //Load Tflite Model And Labels
  void loadModel() async {
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      childWidget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: !cameraController!.value.isInitialized
                    ? Container()
                    : AspectRatio(
                        aspectRatio: cameraController!.value.aspectRatio,
                        child: CameraPreview(cameraController!),
                      )),
          ),
          const Center(
            child: Text(
              "Get Close To Camera",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
