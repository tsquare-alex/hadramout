// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientModel _$ClientModelFromJson(Map<String, dynamic> json) => ClientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      number: json['number'] as int,
      address: json['address'] as String,
      building: json['building'] as String,
      floor: json['floor'] as String,
      apartment: json['apartment'] as String,
    );

Map<String, dynamic> _$ClientModelToJson(ClientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'address': instance.address,
      'building': instance.building,
      'floor': instance.floor,
      'apartment': instance.apartment,
    };
