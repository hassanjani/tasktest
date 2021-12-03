import 'package:meta/meta.dart';
import 'dart:convert';

List<Products> productsFromMap(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromMap(x)));

String productsToMap(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Products {
  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  factory Products.fromMap(Map<String, dynamic> json) => Products(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromMap(json["rating"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toMap(),
  };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toMap() => {
    "rate": rate,
    "count": count,
  };
}

