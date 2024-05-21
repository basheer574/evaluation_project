import 'package:camera/camera.dart';
import 'package:evaluation_project/firebase_options.dart';
import 'package:evaluation_project/widgets/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//Initialize cameras list
List<CameraDescription> cameras = [];

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Flutter Application
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  cameras = await availableCameras();
  runApp(const MaterialApp(
    home: AuthPage(),
    debugShowCheckedModeBanner: false,
    title: "Evaluation Project",
  ));
}

