// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'row_item_model.dart';

/// This class defines the variables used in the [meal_details_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MealDetailsModel extends Equatable {
  MealDetailsModel({this.rowItemList = const []}) {}

  List<RowItemModel> rowItemList;

  MealDetailsModel copyWith({List<RowItemModel>? rowItemList}) {
    return MealDetailsModel(
      rowItemList: rowItemList ?? this.rowItemList,
    );
  }

  @override
  List<Object?> get props => [rowItemList];
}
