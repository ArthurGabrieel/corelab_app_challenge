import 'package:corelab_app_challenge/features/search/data/datasources/search_datasource.dart';
import 'package:corelab_app_challenge/shared/domain/entities/product.dart';
import 'package:corelab_app_challenge/shared/external/mock/products_mock.dart';

class SearchMockDataSource implements SearchDataSource {
  final ProductsMock database;

  SearchMockDataSource(this.database);

  @override
  Future<List<String>> getRecentsSearchs() async {
    return database.recentsSearchs.reversed.toList();
  }

  @override
  Future<List<Product>> search(String query) async {
    return database.search(query);
  }

  @override
  Future<void> saveSearch(String search) async {
    return database.saveSearch(search);
  }
}
