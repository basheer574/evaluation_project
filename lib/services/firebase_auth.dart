import 'package:firebase_auth/firebase_auth.dart';

//Create Firebase Auth Class
class Auth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  //Get Users Stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  //Enable Signing in using email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password
  }) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}