// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesModel _$SpeciesModelFromJson(Map<String, dynamic> json) => SpeciesModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      price: (json['price'] as num).toDouble(),
      createdAt: json['created_at'] as String,
      section: SectionModel.fromJson(json['section'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeciesModelToJson(SpeciesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'created_at': instance.createdAt,
      'section': instance.section,
    };
