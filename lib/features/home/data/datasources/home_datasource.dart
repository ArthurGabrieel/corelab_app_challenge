import 'package:corelab_app_challenge/shared/data/models/product_model.dart';

abstract class HomeDataSource {
  Future<List<ProductModel>> fetchTodayProducts();
  Future<List<ProductModel>> fetchYesterdayProducts();
}
