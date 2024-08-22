import 'package:corelab_app_challenge/shared/domain/entities/product.dart';

abstract class SearchDataSource {
  Future<List<String>> getRecentsSearchs();
  Future<List<Product>> search(String query);
  Future<void> saveSearch(String search);
}
