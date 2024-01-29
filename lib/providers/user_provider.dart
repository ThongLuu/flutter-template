import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class UserProvider extends ChangeNotifier {
  int userId = 0;

  static final cache = Hive.box('app');

  Future<void> loadFromCache() async {
    int? cachedUser = await cache.get('userId');

    if (cachedUser == null) return;

    userIdUpdate = cachedUser;
  }

  set userIdUpdate(int i) {
    userId = i;
    cache.put('userId', i);
    notifyListeners();
  }

  int get userIdGet {
    int? cachedUser = cache.get('userId');

    if (cachedUser == null) return userId;
    return cachedUser;
  }
}
