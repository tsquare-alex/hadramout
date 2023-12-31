// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishesModel _$DishesModelFromJson(Map<String, dynamic> json) => DishesModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
      createdAt: json['created_at'] as String,
      section: SectionModel.fromJson(json['section'] as Map<String, dynamic>),
      offer: json['offer'] as bool,
      offerValue: json['offerValue'] as int,
    );

Map<String, dynamic> _$DishesModelToJson(DishesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'created_at': instance.createdAt,
      'section': instance.section,
      'offer': instance.offer,
      'offerValue': instance.offerValue,
    };
