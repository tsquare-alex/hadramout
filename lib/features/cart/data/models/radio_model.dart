import 'package:hadrmouthamza/src/app_export.dart';


class RadioModel extends Equatable{

  final String title;
  bool active;


  RadioModel({
  required this.title,
    this.active=false,
  });

  @override
  List<Object?> get props => [
  title,
    active,
  ];

  Map<String, dynamic> toJson() {
  return {
  'title': title,
  'fees': active,
  };
  }

  factory RadioModel.fromJson(Map<String, dynamic> json) {
  return RadioModel(
  title: json['title'] ?? '',
    active: json['fees'] ?? false,
  );
  }

}