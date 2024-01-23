part of 'cubit.dart';

class ProductDataProvider {
  static final dio = Dio();

  /// [apiKey] is required, you can get it from newsapi.org
  static final apiKey = dotenv.env['apiKey'];
  static final blogId = dotenv.env['blogId'];
  static final cache = Hive.box('productBox');
  static final appCache = Hive.box('app');
  static final apiHost = dotenv.env['apiHost'];

  static Future<Product?> fetch(String productId) async {
    try {
      final response = await dio.get(
        '${apiHost}/api/v1/haravan/product/${productId}',
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
      // Product product ;
      if (isSuccess) {
        // printOut(raw.toString());
        Product product = Product.fromJsonApi(raw['data']);
        // product = List.generate(
        //   raw.length,
        //   (index) {
        //     Map<String, dynamic> d = json.decode(rawProduct[index]);
        //     printOut("d.toString()");
        //     printOut(d.toString());
        //     return Product.fromJsonApi(d);
        //   },
        // );
        // printOut(product.toString());
        await cache.put("product", product);
        await appCache.put('productTime', DateTime.now());
        return product;
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

  static Future<List<Product>?> fetchHive(String keyword) async {
    try {
      // printOut("fetch Hive");
      List? cachedProduct = cache.get("product");

      if (cachedProduct == null) return null;
      // printOut(cachedProduct.toString());

      List<Product>? article = List.generate(
        cachedProduct.length,
        (index) => cachedProduct[index],
      );
      return article;
    } catch (e) {
      printOut(e.toString());
      throw Exception(e.toString());
    }
  }
}
