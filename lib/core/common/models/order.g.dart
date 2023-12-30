// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['id'] as String,
      cancelled: json['cancelled'] as bool,
      client: ClientModel.fromJson(json['client'] as Map<String, dynamic>),
      confirmed: json['confirmed'] as bool,
      deliveryFees: (json['delivery_fees'] as num).toDouble(),
      delivered: json['delivered'] as bool,
      price: (json['price'] as num).toDouble(),
      species: (json['species'] as List<dynamic>?)
          ?.map((e) => SpeciesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => DishesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cancelled': instance.cancelled,
      'client': instance.client,
      'confirmed': instance.confirmed,
      'delivery_fees': instance.deliveryFees,
      'delivered': instance.delivered,
      'price': instance.price,
      'species': instance.species,
      'dishes': instance.dishes,
    };
