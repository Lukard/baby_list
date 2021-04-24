import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _auth;

  AuthDataSource(this._auth);

  Stream<User> anonymousLogin(String displayName) {
    return _auth.signInAnonymously().asStream().asyncMap((userCreadential) {
      User user = userCreadential.user!;
      user.updateProfile(displayName: displayName);
      return user;
    });
  }
}
