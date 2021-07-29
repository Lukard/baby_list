import 'package:baby_list/feature/signup/data/error/create_user_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserDataSource {
  final FirebaseAuth _auth;

  CreateUserDataSource(this._auth);

  Future<User> createUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user == null) {
        throw UnknownCreateUserException();
      } else {
        return user;
      }
    } on FirebaseAuthException catch (exception) {
      print(exception);
      if (exception.code == 'weak-password') {
        throw WeakPasswordException(exception.message);
      } else if (exception.code == 'email-already-in-use') {
        throw EmailAlreadyInUseException();
      } else if (exception.code == 'invalid-email') {
        throw InvalidEmailException();
      } else {
        throw UnknownCreateUserException();
      }
    } catch (exception) {
      print(exception);
      throw UnknownCreateUserException();
    }
  }
}
