import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/userprofile1_item_model.dart';
import 'package:hadrmouthamza/presentation/delete_itam_screen/models/delete_itam_model.dart';
part 'delete_itam_event.dart';
part 'delete_itam_state.dart';

/// A bloc that manages the state of a DeleteItam according to the event that is dispatched to it.
class DeleteItamBloc extends Bloc<DeleteItamEvent, DeleteItamState> {
  DeleteItamBloc(DeleteItamState initialState) : super(initialState) {
    on<DeleteItamInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<DeleteItamState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<DeleteItamState> emit,
  ) {
    emit(state.copyWith(
      tf2: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<DeleteItamState> emit,
  ) {
    emit(state.copyWith(
      tf3: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<Userprofile1ItemModel> fillUserprofile1ItemList() {
    return [
      Userprofile1ItemModel(
          titleText: "بطاطس", addText: "إضافه", priceText: "10 EGp"),
      Userprofile1ItemModel(
          titleText: "بطاطس", addText: "إضافه", priceText: "10 EGp"),
      Userprofile1ItemModel(
          titleText: "بطاطس", addText: "إضافه", priceText: "10 EGp"),
      Userprofile1ItemModel(
          titleText: "بطاطس", addText: "إضافه", priceText: "10 EGp"),
      Userprofile1ItemModel(
          titleText: "بطاطس", addText: "إضافه", priceText: "10 EGp"),
      Userprofile1ItemModel(
          titleText: "بطاطس", addText: "إضافه", priceText: "10 EGp")
    ];
  }

  _onInitialize(
    DeleteItamInitialEvent event,
    Emitter<DeleteItamState> emit,
  ) async {
    emit(state.copyWith(
      tf2: false,
      tf3: false,
    ));
    emit(state.copyWith(
        deleteItamModelObj: state.deleteItamModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      userprofile1ItemList: fillUserprofile1ItemList(),
    )));
  }
}
