// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'k0_item_model.dart';

/// This class defines the variables used in the [set_a_date_to_send_the_food_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SetADateToSendTheFoodModel extends Equatable {
  SetADateToSendTheFoodModel({this.k0ItemList = const []}) {}

  List<K0ItemModel> k0ItemList;

  SetADateToSendTheFoodModel copyWith({List<K0ItemModel>? k0ItemList}) {
    return SetADateToSendTheFoodModel(
      k0ItemList: k0ItemList ?? this.k0ItemList,
    );
  }

  @override
  List<Object?> get props => [k0ItemList];
}
