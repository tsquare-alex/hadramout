import 'package:hadrmouthamza/src/app_export.dart';

import 'section.dart';

part 'dishes.g.dart';

@JsonSerializable()
class DishesModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final SectionModel section;
  final bool offer;
  final int offerValue;

  const DishesModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.createdAt,
    required this.section,
    required this.offer,
    required this.offerValue,
  });
  factory DishesModel.fromJson(Map<String, dynamic> json) =>
      _$DishesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishesModelToJson(this);

  @override
  List<Object> get props => [
        id,
        title,
        description,
        image,
        price,
        createdAt,
        section,
        offer,
        offerValue,
      ];
}
