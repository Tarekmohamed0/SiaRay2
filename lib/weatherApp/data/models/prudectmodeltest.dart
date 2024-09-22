class ProductModel {
  final String name;
  final double price;
  final String description;
  final String imageurl;
  final String category;
  final int id;
  final int rating;
  final int quantity;
  final bool isFavourite;
  final bool isPopular;
  final bool isRecommended;
  final bool isTrending;
  final bool isOnSale;
  final bool isNew;
  final bool isFeatured;
  final bool isBestSeller;
  final bool isLimited;
  final bool isExclusive;
  final bool isDiscounted;
  final bool isSoldOut;
  final bool isAvailable;
  final bool isOutOfStock;
  final bool isComingSoon;
  final bool isPreOrder;
  final bool isOnSaleNow;
  final bool isOnSaleSoon;
  final bool isOnSaleLater;

  ProductModel({
    required this.name,
    required this.price,
    required this.description,
    required this.imageurl,
    required this.category,
    required this.id,
    required this.rating,
    required this.quantity,
    required this.isFavourite,
    required this.isPopular,
    required this.isRecommended,
    required this.isTrending,
    required this.isOnSale,
    required this.isNew,
    required this.isFeatured,
    required this.isBestSeller,
    required this.isLimited,
    required this.isExclusive,
    required this.isDiscounted,
    required this.isSoldOut,
    required this.isAvailable,
    required this.isOutOfStock,
    required this.isComingSoon,
    required this.isPreOrder,
    required this.isOnSaleNow,
    required this.isOnSaleSoon,
    required this.isOnSaleLater,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imageurl: json['imageurl'],
      category: json['category'],
      id: json['id'],
      rating: json['rating'],
      quantity: json['quantity'],
      isFavourite: json['isFavourite'],
      isPopular: json['isPopular'],
      isRecommended: json['isRecommended'],
      isTrending: json['isTrending'],
      isOnSale: json['isOnSale'],
      isNew: json['isNew'],
      isFeatured: json['isFeatured'],
      isBestSeller: json['isBestSeller'],
      isLimited: json['isLimited'],
      isExclusive: json['isExclusive'],
      isDiscounted: json['isDiscounted'],
      isSoldOut: json['isSoldOut'],
      isAvailable: json['isAvailable'],
      isOutOfStock: json['isOutOfStock'],
      isComingSoon: json['isComingSoon'],
      isPreOrder: json['isPreOrder'],
      isOnSaleNow: json['isOnSaleNow'],
      isOnSaleSoon: json['isOnSaleSoon'],
      isOnSaleLater: json['isOnSaleLater'],
    );
  }
}
