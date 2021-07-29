import 'package:baby_list/feature/signup/data/datasource/create_user_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserUseCase {
  final CreateUserDataSource _createUserDataSource;

  CreateUserUseCase(this._createUserDataSource);

  Future<User> call(String username, String email, String password) async {
    User newUser = await _createUserDataSource.createUser(email, password);
    await newUser.updateProfile(displayName: username);

    return newUser;
  }
}
