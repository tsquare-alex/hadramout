import 'package:hadrmouthamza/src/app_export.dart';

part 'client.g.dart';

@JsonSerializable()
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

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);

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
}
