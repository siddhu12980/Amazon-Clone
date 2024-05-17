// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String role;
  final String token;
  final List<dynamic> cart;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.role,
    required this.token,
    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'role': role,
      'token': token,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: (map["id"] ?? '') as String,
      name: (map["name"] ?? '') as String,
      email: (map["email"] ?? '') as String,
      password: (map["password"] ?? '') as String,
      address: (map["address"] ?? '') as String,
      role: (map["role"] ?? '') as String,
      token: (map["token"] ?? '') as String,
      cart: List<dynamic>.from(
        ((map['cart'] ?? const <dynamic>[]) as List<dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, address: $address, role: $role, token: $token, cart: $cart)';
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? role,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      role: role ?? this.role,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.address == address &&
        other.role == role &&
        other.token == token &&
        listEquals(other.cart, cart);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        address.hashCode ^
        role.hashCode ^
        token.hashCode ^
        cart.hashCode;
  }
}
