class ProductModel {
  final String id;
  final String name;
  final String price;
  final String? imageUrl;
  final String? description;
  final String? category;
  final double? rating;
  final int? reviewCount;
  final bool isOnSale;
  final String? discountPercentage;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl,
    this.description,
    this.category,
    this.rating,
    this.reviewCount,
    this.isOnSale = false,
    this.discountPercentage,
  });

  // Factory method to create from JSON (for future API integration)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? '₦0',
      imageUrl: json['imageUrl'],
      description: json['description'],
      category: json['category'],
      rating: json['rating']?.toDouble(),
      reviewCount: json['reviewCount'],
      isOnSale: json['isOnSale'] ?? false,
      discountPercentage: json['discountPercentage'],
    );
  }

  // Convert to JSON (for future API integration)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
      'rating': rating,
      'reviewCount': reviewCount,
      'isOnSale': isOnSale,
      'discountPercentage': discountPercentage,
    };
  }

  // Create a copy with updated fields
  ProductModel copyWith({
    String? id,
    String? name,
    String? price,
    String? imageUrl,
    String? description,
    String? category,
    double? rating,
    int? reviewCount,
    bool? isOnSale,
    String? discountPercentage,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isOnSale: isOnSale ?? this.isOnSale,
      discountPercentage: discountPercentage ?? this.discountPercentage,
    );
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, name: $name, price: $price, isOnSale: $isOnSale}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          price == other.price;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode;
}

// Sample data for testing
class ProductData {
  static List<ProductModel> getSampleProducts() {
    return [
      ProductModel(
        id: '1',
        name: 'Samsung Galaxy Z Fold 5',
        price: '₦2,519,000',
        category: 'Phones',
        rating: 4.5,
        reviewCount: 128,
        isOnSale: true,
        discountPercentage: '-16%',
      ),
      ProductModel(
        id: '2',
        name: 'Samsung Galaxy Z Flip 5',
        price: '₦2,750,000',
        category: 'Phones',
        rating: 4.3,
        reviewCount: 95,
        isOnSale: true,
        discountPercentage: '-29%',
      ),
      ProductModel(
        id: '3',
        name: 'Samsung Galaxy S24 Ultra',
        price: '₦2,487,000',
        category: 'Phones',
        rating: 4.7,
        reviewCount: 256,
        isOnSale: true,
        discountPercentage: '-45%',
      ),
      ProductModel(
        id: '4',
        name: 'Samsung Galaxy Note 20',
        price: '₦3,299,000',
        category: 'Phones',
        rating: 4.4,
        reviewCount: 189,
        isOnSale: true,
        discountPercentage: '-33%',
      ),
      ProductModel(
        id: '5',
        name: 'Samsung Galaxy A54',
        price: '₦1,819,000',
        category: 'Phones',
        rating: 4.2,
        reviewCount: 67,
      ),
      ProductModel(
        id: '6',
        name: 'Samsung Galaxy Tab S9',
        price: '₦3,850,000',
        category: 'Tablets',
        rating: 4.6,
        reviewCount: 143,
      ),
    ];
  }
}
