import 'package:hadrmouthamza/core/common/models/section.dart';
import 'package:hadrmouthamza/core/common/models/species.dart';
import 'package:hadrmouthamza/src/app_export.dart';

class CartModel extends Equatable {
  final String title;
  final String? description;
  final String? image;
  final SpeciesModel species;
  double price;
  double totalPrice;
  int quantity;

  CartModel(
      {required this.title,
       this.description,
        this.image,
      required this.price,
      required this.totalPrice,
      required this.quantity,
        required this.species
      });

  @override
  List<Object?> get props => [title, description, image, price, quantity,totalPrice,species];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'totalPrice': totalPrice,
      'quantity': quantity,
      'species': species.toJson(),
    };
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      title: json['title'] ?? '',
      species: SpeciesModel.fromJson(json['species']),
      description: json['description'],
      image: json['image'],
      quantity: json['quantity']?.toInt() ?? 1,
      price: json['price']?.toDouble() ?? 0.0,
      totalPrice: json['totalPrice']?.toDouble() ?? 0.0,
    );
  }
}
