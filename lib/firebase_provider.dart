import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
 FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;

  void login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _user = userCredential.user;
      print(_user);
      
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        notifyListeners();
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        notifyListeners();
      }
    }
  }

  void register(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user = userCredential.user;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        notifyListeners();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}