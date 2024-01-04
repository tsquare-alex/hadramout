import 'package:hadrmouthamza/src/app_export.dart';

import 'section.dart';

class SpeciesModel extends Equatable {
  final String id;
  final String title;
  final String? description;
  final String? image;
  final double price;
  final String createdAt;
  final SectionModel section;
  final bool? offer;
  final int? offerValue;
  int? quantity;

  SpeciesModel({
    required this.id,
    required this.title,
    this.description,
    this.image,
    required this.price,
    required this.createdAt,
    required this.section,
     this.offer,
     this.offerValue,
    this.quantity,
  });

  @override
  List<Object?> get props =>
      [id, title, description, image, price, createdAt, section,offer,offerValue];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'quantity': quantity,
      'created_at': createdAt,
      'section': section.toJson(),
      'offer': offer,
      'offerValue': offerValue,
    };
  }

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      image: json['image'],
      quantity: json['quantity']?.toInt()??1,
      price: json['price']?.toDouble() ?? 0.0,
      createdAt: json['created_at'] ?? '',
      section: SectionModel.fromJson(json['section']),
      offer: json['offer'] ?? false,
      offerValue: json['offerValue']?.toInt() ?? 0,
    );
  }
}
