import 'package:corelab_app_challenge/features/home/data/datasources/home_datasource.dart';
import 'package:corelab_app_challenge/shared/data/models/product_model.dart';
import 'package:corelab_app_challenge/shared/external/mock/products_mock.dart';

class HomeMockDataSourceImpl implements HomeDataSource {
  final ProductsMock database;

  HomeMockDataSourceImpl(this.database);

  @override
  Future<List<ProductModel>> fetchTodayProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    final products = database.products
        .where((element) => element.createdAt.day == DateTime.now().day)
        .toList();

    return products;
  }

  @override
  Future<List<ProductModel>> fetchYesterdayProducts() async {
    final products = database.products
        .where((element) =>
            element.createdAt.day ==
            DateTime.now().subtract(const Duration(days: 1)).day)
        .toList();

    return products;
  }
}
