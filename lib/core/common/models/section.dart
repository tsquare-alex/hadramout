import 'package:hadrmouthamza/src/app_export.dart';

class SectionModel extends Equatable {
  final String id;
  final String title;
  final String image;
  final int index;

  const SectionModel({
    required this.id,
    required this.title,
    required this.image,
    required this.index,
  });

  @override
  List<Object> get props => [id, title, index];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'index': index,
    };
  }

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      index: json['index']?.toInt() ?? 0,
    );
  }
}
