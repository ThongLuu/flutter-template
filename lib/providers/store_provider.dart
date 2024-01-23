import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class StoreProvider extends ChangeNotifier {
  int storeId = 0;

  static final cache = Hive.box('app');

  Future<void> loadFromCache() async {
    int? cachedStore = await cache.get('storeId');

    if (cachedStore == null) return;

    storeIdUpdate = cachedStore;
  }

  set storeIdUpdate(int i) {
    storeId = i;
    cache.put('storeId', i);
    notifyListeners();
  }

  int get storeIdGet {
    int? cachedStore = cache.get('storeId');

    if (cachedStore == null) return storeId;
    return cachedStore;
  }
}
