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

  const SpeciesModel({
    required this.id,
    required this.title,
    this.description,
    this.image,
    required this.price,
    required this.createdAt,
    required this.section,
  });

  @override
  List<Object?> get props =>
      [id, title, description, image, price, createdAt, section];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'price': price,
      'created_at': createdAt,
      'section': section.toJson(),
    };
  }

  factory SpeciesModel.fromJson(Map<String, dynamic> json) {
    return SpeciesModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      image: json['image'],
      price: json['price']?.toDouble() ?? 0.0,
      createdAt: json['created_at'] ?? '',
      section: SectionModel.fromJson(json['section']),
    );
  }
}
