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
    this.isNew = true,
    required this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
