import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth;

  Auth({required this.auth});

  Stream<User?> get user => auth.authStateChanges();

  Future<String> createAccount(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseException catch (i) {
      return i.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return "Success";
    } on FirebaseException catch (i) {
      return i.message.toString();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> signOutUser() async {
    try {
      await auth.signOut();
      return "Success";
    } on FirebaseException catch (i) {
      return i.message.toString();
    } catch (e) {
      rethrow;
    }
  }
}
