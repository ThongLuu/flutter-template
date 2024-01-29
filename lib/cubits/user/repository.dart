part of 'cubit.dart';

class UserRepository {
  Future<User?> login(String username, String password) =>
      UserDataProvider.login(username, password);

  Future<User?> fetchHive(String username, String password) =>
      UserDataProvider.fetchHive(username, password);
}
