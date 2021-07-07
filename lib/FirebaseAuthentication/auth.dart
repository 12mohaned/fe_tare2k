import 'package:firebase_auth/firebase_auth.dart';
import 'package:fe_tare2k/Model/User.dart';
import 'package:crypt/crypt.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future signup(String firstName, String lastName, String email,
      int phoneNumber, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      var hashedPassword = Crypt.sha256(password);
      user(
          uid: userCredential.user!.uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          password: hashedPassword.toString());
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return passwordStatus.weak;
      } else if (e.code == 'email-already-in-use') {
        return emailStatus.Exists;
      }
    } catch (e) {
      return e;
    }
  }

  Future loginIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return emailStatus.DoNotExists;
      } else if (e.code == 'wrong-password') {
        return passwordStatus.wrong;
      }
    }
  }
}

enum emailStatus { Verified, Exists, DoNotExists }

enum passwordStatus { wrong, weak }
