import 'package:baby_list/core/domain/model/baby_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _auth;

  AuthDataSource(this._auth);

  bool isUserLoggedIn() => _auth.currentUser != null;

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
}
