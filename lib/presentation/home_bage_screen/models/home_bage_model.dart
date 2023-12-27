// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'settingslist_item_model.dart';
import 'userprofile_item_model.dart';
import 'orderdetails_item_model.dart';

/// This class defines the variables used in the [home_bage_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeBageModel extends Equatable {
  HomeBageModel({
    this.settingslistItemList = const [],
    this.userprofileItemList = const [],
    this.orderdetailsItemList = const [],
  }) {}

  List<SettingslistItemModel> settingslistItemList;

  List<UserprofileItemModel> userprofileItemList;

  List<OrderdetailsItemModel> orderdetailsItemList;

  HomeBageModel copyWith({
    List<SettingslistItemModel>? settingslistItemList,
    List<UserprofileItemModel>? userprofileItemList,
    List<OrderdetailsItemModel>? orderdetailsItemList,
  }) {
    return HomeBageModel(
      settingslistItemList: settingslistItemList ?? this.settingslistItemList,
      userprofileItemList: userprofileItemList ?? this.userprofileItemList,
      orderdetailsItemList: orderdetailsItemList ?? this.orderdetailsItemList,
    );
  }

  @override
  List<Object?> get props =>
      [settingslistItemList, userprofileItemList, orderdetailsItemList];
}
