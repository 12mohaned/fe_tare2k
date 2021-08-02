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
      }else{
        if(e.code == 'invalid-email'){
          return emailStatus.invalid;
        }else{
          if(e.code == 'operation-not-allowed'){
            return emailStatus.disabled;
          }
        }
      }
    } catch (e) {
      return e;
    }
    return authenticationStatus.completed;
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
      }else{
        if(e.code == 'user-disabled'){
          return emailStatus.disabled;
        }else{
          if(e.code == 'invalid-email'){
            return emailStatus.invalid;
          }
        }
      }
    }
    return authenticationStatus.completed;

  }
}

enum emailStatus { Verified, Exists, DoNotExists, disabled, invalid }

enum passwordStatus { wrong, weak}

enum authenticationStatus{completed}
