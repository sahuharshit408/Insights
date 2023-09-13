import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insights/screens/bottom_nav.dart';
import 'package:insights/utils/preference_utlis.dart';
import 'package:insights/utils/utils.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isLoggedIn() async {
    final user = _auth.currentUser;
    user?.getIdToken().then((value) => setString("token", value!));
    print(await user?.getIdToken(true));
    if (user == null) {
      return false;
    }
    return true;
  }

  String? getUserId() {
    final user = _auth.currentUser;
    return user?.uid;
  }

  Future<void> registerWithEmailAndPassword({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showSnackBar(context: context, content: "Success");

      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          showSnackBar(context: context, content: "Email Already In Use");
          break;
        case "invalid-email":
          showSnackBar(context: context, content: "Invalid Email");
          break;
        case "operation-not-allowed":
          showSnackBar(context: context, content: "Operation Not Allowed");
          break;
        case "weak-password":
          showSnackBar(context: context, content: "Weak Password");
          break;
        default:
          showSnackBar(context: context, content: "Success");
      }
    }
  }

  Future<void> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = await user.user!.getIdToken(true);
      setString("token", token!);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          showSnackBar(context: context, content: "Invalid Email");
          break;
        case "user-disabled":
          showSnackBar(context: context, content: "User Disabled");
          break;
        case "user-not-found":
          showSnackBar(context: context, content: "User Not Found");
          break;
        case "wrong-password":
          showSnackBar(context: context, content: "Wrong Password");
          break;
        default:
          showSnackBar(context: context, content: "Success");
      }
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<void> signInWithGoogle({required BuildContext context}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      final token = await user.user!.getIdToken();
      setString("token", token!);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const BottomNav(),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
