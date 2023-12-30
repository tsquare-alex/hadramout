import 'package:hadrmouthamza/src/app_export.dart';

import 'client.dart';
import 'dishes.dart';
import 'species.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderModel extends Equatable {
  final String id;
  final bool cancelled;
  final ClientModel client;
  final bool confirmed;
  @JsonKey(name: 'delivery_fees')
  final double deliveryFees;
  final bool delivered;
  final double price;
  final List<SpeciesModel>? species;
  final List<DishesModel>? dishes;

  const OrderModel({
    required this.id,
    required this.cancelled,
    required this.client,
    required this.confirmed,
    required this.deliveryFees,
    required this.delivered,
    required this.price,
    this.species,
    this.dishes,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        cancelled,
        client,
        confirmed,
        delivered,
        deliveryFees,
        price,
        species,
        dishes,
      ];
}
