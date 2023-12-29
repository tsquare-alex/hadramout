import 'package:hadrmouthamza/features/dashboard/data/models/section.dart';
import 'package:hadrmouthamza/src/app_export.dart';

part 'species.g.dart';

@JsonSerializable()
class SpeciesModel extends Equatable {
  final String id;
  final String title;
  final String? description;
  final String? image;
  final double price;
  @JsonKey(name: 'created_at')
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
  factory SpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$SpeciesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesModelToJson(this);

  @override
  List<Object> get props =>
      [id, title, description!, image!, price, createdAt, section];
}
