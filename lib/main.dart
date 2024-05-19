import 'package:evaluation_project/firebase_options.dart';
import 'package:evaluation_project/screens/login_screen.dart';
import 'package:evaluation_project/widgets/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const EvaluationApp());
}
class EvaluationApp extends StatefulWidget {
  const EvaluationApp({super.key});

  @override
  State<EvaluationApp> createState() => _EvaluationAppState();
}

class _EvaluationAppState extends State<EvaluationApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}
