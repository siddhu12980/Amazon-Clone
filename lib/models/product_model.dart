// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String catogery;
  final List<String> images;
  final String? id;
  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.catogery,
    required this.images,
    this.id,
  });

  Product copyWith({
    String? name,
    String? description,
    double? price,
    double? quantity,
    String? catogery,
    List<String>? images,
    String? id,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      catogery: catogery ?? this.catogery,
      images: images ?? this.images,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'catogery': catogery,
      'images': images,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: (map["name"] ?? '') as String,
      description: (map["description"] ?? '') as String,
      price: (map["price"] ?? 0.0) as double,
      quantity: (map["quantity"] ?? 0.0) as double,
      catogery: (map["catogery"] ?? '') as String,
      images: List<String>.from(
        ((map['images'] ?? const <String>[]) as List<String>),
      ),
      id: map['_id'] != null ? map["_id"] ?? '' : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(name: $name, description: $description, price: $price, quantity: $quantity, catogery: $catogery, images: $images, id: $id)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.price == price &&
        other.quantity == quantity &&
        other.catogery == catogery &&
        listEquals(other.images, images) &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        catogery.hashCode ^
        images.hashCode ^
        id.hashCode;
  }
}
