import 'dart:convert';

class Rating {
  final String userID;
  final double rating;
  Rating({
    required this.userID,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'rating': rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userID: map['userID'] ?? '',
      rating: map['rating']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));
}
