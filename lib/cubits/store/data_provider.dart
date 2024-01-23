part of 'cubit.dart';

class StoresDataProvider {
  static final dio = Dio();

  /// [apiKey] is required, you can get it from newsapi.org
  static final apiKey = dotenv.env['apiKey'];
  static final blogId = dotenv.env['blogId'];
  static final cache = Hive.box('storesbox');
  static final appCache = Hive.box('app');
  static final apiHost = dotenv.env['apiHost'];

  static Future<List<Store>> fetch() async {
    try {
      final response = await dio.post(
        '${apiHost}/api/v1/store/business/store/list',
        data: {"page": 1, "pageSize": 30},
        // 'https://newsapi.org/v2/everything?q=$keyword',
        options: Options(
          headers: {
            // 'Authorization': apiKey,
            'Content-Type': 'application/json'
          },
        ),
      );
      // printOut(response.statusMessage);

      Map raw = response.data;

      bool isSuccess = raw['success'];
      List<Store> stores = [];
      if (isSuccess) {
        // printOut(raw.toString());
        List<dynamic> rawStore = raw['data'];
        // printOut("isSuccess");

        for (var sItem in rawStore) {
          stores.add(Store.fromJsonApi(sItem));
        }
        // stores = List.generate(
        //   raw.length,
        //   (index) {
        //     Map<String, dynamic> d = json.decode(rawStore[index]);
        //     printOut("d.toString()");
        //     printOut(d.toString());
        //     return Store.fromJsonApi(d);
        //   },
        // );
        // printOut(stores.toString());
        await cache.put("store", stores);
        await appCache.put('storesTime', DateTime.now());
      }

      // printOut(stores.toString());
      return stores;
    } on DioError catch (e) {
      if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          throw Exception('Poor internet connection. Please try again!');
        } else {
          throw Exception(e.message);
        }
      } else {
        throw Exception('Problem connecting to the server. Please try again.');
      }
    } catch (e) {
      printOut(e.toString());
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<Store>?> fetchHive() async {
    try {
      // printOut("fetch Hive");
      List? cachedStore = cache.get("store");

      if (cachedStore == null) return null;
      // printOut(cachedStore.toString());

      List<Store>? article = List.generate(
        cachedStore.length,
        (index) => cachedStore[index],
      );
      return article;
    } catch (e) {
      printOut(e.toString());
      throw Exception(e.toString());
    }
  }
}
