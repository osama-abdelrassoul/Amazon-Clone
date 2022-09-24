// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:amazon_clone/models/rating.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<String> images;
  final String? id;
  final List<Rating>? rating;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.category,
      required this.images,
      this.id,
      this.rating});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'category': category,
      'images': images,
      '_id': id,
      'rating': rating
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'] as String,
        description: map['description'] as String,
        price: (map['price'] as num).toDouble(),
        quantity: (map['price'] as num).toDouble(),
        category: map['category'] as String,
        images: List<String>.from(map['images']),
        id: map['_id'],
        rating: map['ratings'] != null
            ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
            : null);
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
