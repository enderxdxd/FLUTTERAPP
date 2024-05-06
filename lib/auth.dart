import 'package:firebase_auth/firebase_auth.dart';  // Path to this Firebase configuration file

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message); // Customize or handle exceptions as needed
    }
  }

  Future<void> createUserWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message); // Customize or handle exceptions as needed
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
