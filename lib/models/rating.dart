// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rating {
  final String userID;
  final double rating;
  const Rating({
    required this.userID,
    required this.rating,
  });

  Rating copyWith({
    String? userID,
    double? rating,
  }) {
    return Rating(
      userID: userID ?? this.userID,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'rating': rating,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userID: (map["userID"] ?? '') as String,
      rating: (map["rating"] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) =>
      Rating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Rating(userID: $userID, rating: $rating)';

  @override
  bool operator ==(covariant Rating other) {
    if (identical(this, other)) return true;

    return other.userID == userID && other.rating == rating;
  }

  @override
  int get hashCode => userID.hashCode ^ rating.hashCode;
}
