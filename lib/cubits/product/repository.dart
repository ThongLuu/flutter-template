part of 'cubit.dart';

class ProductRepository {
  Future<Product?> fetchApi(String keyword) =>
      ProductDataProvider.fetch(keyword);

  Future<List<Product>?> fetchHive(String keyword) =>
      ProductDataProvider.fetchHive(keyword);
}
