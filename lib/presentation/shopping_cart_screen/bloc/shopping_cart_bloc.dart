import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userprofilelist_item_model.dart';
import '../models/productcard_item_model.dart';
import 'package:hadrmouthamza/presentation/shopping_cart_screen/models/shopping_cart_model.dart';
part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

/// A bloc that manages the state of a ShoppingCart according to the event that is dispatched to it.
class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  ShoppingCartBloc(ShoppingCartState initialState) : super(initialState) {
    on<ShoppingCartInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ShoppingCartInitialEvent event,
    Emitter<ShoppingCartState> emit,
  ) async {
    emit(state.copyWith(
        shoppingCartModelObj: state.shoppingCartModelObj?.copyWith(
      userprofilelistItemList: fillUserprofilelistItemList(),
      productcardItemList: fillProductcardItemList(),
    )));
  }

  List<UserprofilelistItemModel> fillUserprofilelistItemList() {
    return [
      UserprofilelistItemModel(
          one: "1", widget: "صنيه الحبايب - عروض حصريه", priceText: "500EGP"),
      UserprofilelistItemModel(
          one: "1", widget: "صنيه الحبايب - عروض حصريه", priceText: "500EGP")
    ];
  }

  List<ProductcardItemModel> fillProductcardItemList() {
    return [
      ProductcardItemModel(
          title: "بطاطس", buttonText: "إضافه", price: "10 EGp"),
      ProductcardItemModel(
          title: "بطاطس", buttonText: "إضافه", price: "10 EGp"),
      ProductcardItemModel(
          title: "بطاطس", buttonText: "إضافه", price: "10 EGp"),
      ProductcardItemModel(title: "بطاطس", price: "10 EGp"),
      ProductcardItemModel(
          title: "بطاطس", buttonText: "إضافه", price: "10 EGp"),
      ProductcardItemModel(title: "بطاطس", buttonText: "إضافه", price: "10 EGp")
    ];
  }
}
