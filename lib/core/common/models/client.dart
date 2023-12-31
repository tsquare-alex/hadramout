import 'package:hadrmouthamza/src/app_export.dart';

class ClientModel extends Equatable {
  final String id;
  final String name;
  final int number;
  final String address;
  final String building;
  final String floor;
  final String apartment;

  const ClientModel({
    required this.id,
    required this.name,
    required this.number,
    required this.address,
    required this.building,
    required this.floor,
    required this.apartment,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        number,
        building,
        floor,
        apartment,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'address': address,
      'building': building,
      'floor': floor,
      'apartment': apartment,
    };
  }

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      number: json['number']?.toInt() ?? 0,
      address: json['address'] ?? '',
      building: json['building'] ?? '',
      floor: json['floor'] ?? '',
      apartment: json['apartment'] ?? '',
    );
  }
}
