import 'package:corelab_app_challenge/shared/data/models/product_model.dart';

part 'list_products.dart';

class ProductsMock {
  final _recentSearchs = [
    'Ácido Fosfórico',
    'AllPrime',
    'Dentística',
    'Estética',
    '249',
    'Máscara Cirúrgica',
    'Descarpack',
    'Descatáveis',
    '290',
  ];

  List<ProductModel> get products => _products;

  List<String> get recentsSearchs => _recentSearchs;

  List<ProductModel> search(String query) {
    final queryLowerCase = query.toLowerCase();
    return _products
        .where((element) =>
            element.name.toLowerCase().contains(queryLowerCase) ||
            element.price.toString().contains(queryLowerCase) ||
            element.category.toLowerCase().contains(queryLowerCase))
        .toList();
  }

  void saveSearch(String search) {
    _recentSearchs.add(search);
  }
}
