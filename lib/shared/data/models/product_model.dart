import 'package:corelab_app_challenge/shared/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required String name,
    required double price,
    double? oldPrice,
    required String image,
    required int installmentQuantity,
    required double installmentPrice,
    required int discount,
    required bool isNew,
    required DateTime createdAt,
  }) : super(
          name: name,
          price: price,
          oldPrice: oldPrice,
          image: image,
          installmentQuantity: installmentQuantity,
          installmentPrice: installmentPrice,
          discount: discount,
          isNew: isNew,
          createdAt: createdAt,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      oldPrice: json['oldPrice'],
      image: json['image'],
      installmentQuantity: json['installmentQuantity'],
      installmentPrice: json['installmentPrice'],
      discount: json['discount'],
      isNew: json['isNew'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
