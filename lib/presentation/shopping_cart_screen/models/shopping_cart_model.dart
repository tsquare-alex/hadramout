// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'userprofilelist_item_model.dart';
import 'productcard_item_model.dart';

/// This class defines the variables used in the [shopping_cart_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ShoppingCartModel extends Equatable {
  ShoppingCartModel({
    this.userprofilelistItemList = const [],
    this.productcardItemList = const [],
  }) {}

  List<UserprofilelistItemModel> userprofilelistItemList;

  List<ProductcardItemModel> productcardItemList;

  ShoppingCartModel copyWith({
    List<UserprofilelistItemModel>? userprofilelistItemList,
    List<ProductcardItemModel>? productcardItemList,
  }) {
    return ShoppingCartModel(
      userprofilelistItemList:
          userprofilelistItemList ?? this.userprofilelistItemList,
      productcardItemList: productcardItemList ?? this.productcardItemList,
    );
  }

  @override
  List<Object?> get props => [userprofilelistItemList, productcardItemList];
}
