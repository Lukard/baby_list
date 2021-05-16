import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _auth;

  AuthDataSource(this._auth);

  Future<bool> isUserLoggedIn() {
    if (_auth.currentUser != null) return Future<bool>.value(true);

    return _auth.authStateChanges().first.then(
          (user) => user != null,
          onError: () => false,
        );
  }

  Stream<User> anonymousLogin(String displayName) {
    return _auth.signInAnonymously().asStream().asyncMap((userCreadential) {
      User user = userCreadential.user!;
      user.updateProfile(displayName: displayName);
      return user;
    });
  }

  Booking getBooking() => Booking(
        _auth.currentUser!.uid,
        _auth.currentUser!.displayName!,
      );

  String getUserId() => _auth.currentUser!.uid;
}
