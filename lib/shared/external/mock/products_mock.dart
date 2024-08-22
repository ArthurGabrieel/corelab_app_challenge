import 'package:corelab_app_challenge/shared/data/models/product_model.dart';

part 'list_products.dart';

class ProductsMock {
  final _recentSearchs = ['Ácido Fosfórico', 'AllPrime'];

  List<ProductModel> get products => _products;

  List<String> get recentsSearchs => _recentSearchs;

  List<ProductModel> search(String query) {
    return _products
        .where((element) =>
            element.name.toLowerCase().contains(query) ||
            element.price.toString().contains(query) ||
            element.category.toLowerCase().contains(query))
        .toList();
  }

  void saveSearch(String search) {
    _recentSearchs.add(search);
  }
}
