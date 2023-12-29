import 'package:hadrmouthamza/src/app_export.dart';

part 'section.g.dart';

@JsonSerializable()
class SectionModel extends Equatable {
  final String id;
  final String title;

  const SectionModel({
    required this.id,
    required this.title,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionModelToJson(this);

  @override
  List<Object> get props => [id, title];
}
