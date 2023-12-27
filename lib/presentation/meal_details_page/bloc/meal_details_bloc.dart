import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/row_item_model.dart';
import 'package:hadrmouthamza/presentation/meal_details_page/models/meal_details_model.dart';
part 'meal_details_event.dart';
part 'meal_details_state.dart';

/// A bloc that manages the state of a MealDetails according to the event that is dispatched to it.
class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState> {
  MealDetailsBloc(MealDetailsState initialState) : super(initialState) {
    on<MealDetailsInitialEvent>(_onInitialize);
    on<ChangeRadioButtonEvent>(_changeRadioButton);
    on<ChangeRadioButton1Event>(_changeRadioButton1);
  }

  _changeRadioButton(
    ChangeRadioButtonEvent event,
    Emitter<MealDetailsState> emit,
  ) {
    emit(state.copyWith(
      radioGroup: event.value,
    ));
  }

  _changeRadioButton1(
    ChangeRadioButton1Event event,
    Emitter<MealDetailsState> emit,
  ) {
    emit(state.copyWith(
      radioGroup1: event.value,
    ));
  }

  List<RowItemModel> fillRowItemList() {
    return [
      RowItemModel(
          imageClass: ImageConstant.imgCheckmarkPrimary16x16,
          text: "صنيه الحبايب وسط  ( EGP 300)",
          name: ImageConstant.img83x77)
    ];
  }

  _onInitialize(
    MealDetailsInitialEvent event,
    Emitter<MealDetailsState> emit,
  ) async {
    emit(state.copyWith(
      radioGroup: "",
      radioGroup1: "",
    ));
    emit(state.copyWith(
        mealDetailsModelObj: state.mealDetailsModelObj?.copyWith(
      rowItemList: fillRowItemList(),
    )));
  }
}
