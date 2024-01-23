part of 'cubit.dart';

class StoresRepository {
  Future<List<Store>> fetchApi() => StoresDataProvider.fetch();

  Future<List<Store>?> fetchHive() => StoresDataProvider.fetchHive();
}
