import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/settingslist_item_model.dart';
import '../models/userprofile_item_model.dart';
import '../models/orderdetails_item_model.dart';
import 'package:hadrmouthamza/presentation/home_bage_screen/models/home_bage_model.dart';
part 'home_bage_event.dart';
part 'home_bage_state.dart';

/// A bloc that manages the state of a HomeBage according to the event that is dispatched to it.
class HomeBageBloc extends Bloc<HomeBageEvent, HomeBageState> {
  HomeBageBloc(HomeBageState initialState) : super(initialState) {
    on<HomeBageInitialEvent>(_onInitialize);
  }

  List<SettingslistItemModel> fillSettingslistItemList() {
    return [
      SettingslistItemModel(
          settingsImage: ImageConstant.imgSettings,
          settingsText: "إستلام سفرة"),
      SettingslistItemModel(settingsText: "في المنزل"),
      SettingslistItemModel(settingsText: "التوصيل")
    ];
  }

  List<UserprofileItemModel> fillUserprofileItemList() {
    return [
      UserprofileItemModel(
          userImage: ImageConstant.imgImage9,
          dynamicText: "دبل ",
          dynamicText1: " اتشيز برجر",
          dynamicText2: "جنيه",
          dynamicText3: "499",
          dynamicText4: "تطبق الشروط والاحكام & السعر شامل الضريبه")
    ];
  }

  List<OrderdetailsItemModel> fillOrderdetailsItemList() {
    return [
      OrderdetailsItemModel(
          orderTitle: "صنية الحبايب",
          orderDescription:
              "4 برجدبل اتسيز برجر + 3 استربس+3 كنتوك + 3 كلو  سلو + بطاطس عائلي + مشروب 1 لتر")
    ];
  }

  _onInitialize(
    HomeBageInitialEvent event,
    Emitter<HomeBageState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      sliderIndex: 0,
    ));
    emit(state.copyWith(
        homeBageModelObj: state.homeBageModelObj?.copyWith(
      settingslistItemList: fillSettingslistItemList(),
      userprofileItemList: fillUserprofileItemList(),
      orderdetailsItemList: fillOrderdetailsItemList(),
    )));
  }
}
