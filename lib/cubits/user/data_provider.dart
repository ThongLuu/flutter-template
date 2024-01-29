part of 'cubit.dart';

class UserDataProvider {
  static final dio = Dio();

  /// [apiKey] is required, you can get it from newsapi.org
  static final cache = Hive.box('userBox');
  static final appCache = Hive.box('app');
  static final apiHost = dotenv.env['apiHost'];

  static Future<User?> login(String username, String password) async {
    try {
      final response = await dio.get(
        'https://accounts.gearvn.xyz/login?redirect_uri=http://localhost:8888/',
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
      // Product product ;
      if (isSuccess) {
        // printOut(raw.toString());
        User user = User.fromJsonApi(raw['data']);
        await cache.put("user", user);
        await appCache.put('userTime', DateTime.now());
        return user;
      }

      // printOut(product.toString());
      return null;
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

  static Future<User?> fetchHive(String username, String password) async {
    try {
      // printOut("fetch Hive");
      User cachedUser = cache.get("user");

      if (cachedUser == null) return null;
      // printOut(cachedProduct.toString());

      return cachedUser;
    } catch (e) {
      printOut(e.toString());
      throw Exception(e.toString());
    }
  }
}
