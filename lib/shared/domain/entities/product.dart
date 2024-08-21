class Product {
  final String name;
  final double price;
  final double? oldPrice;
  final String image;
  final int installmentQuantity;
  final double installmentPrice;
  final int discount;
  final bool isNew;
  final DateTime createdAt;

  Product({
    required this.name,
    required this.price,
    this.oldPrice,
    required this.image,
    required this.installmentQuantity,
    required this.installmentPrice,
    required this.discount,
    required this.isNew,
    required this.createdAt,
  });
}
