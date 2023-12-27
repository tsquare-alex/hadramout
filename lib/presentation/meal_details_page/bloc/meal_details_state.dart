// ignore_for_file: must_be_immutable

part of 'meal_details_bloc.dart';

/// Represents the state of MealDetails in the application.
class MealDetailsState extends Equatable {
  MealDetailsState({
    this.radioGroup = "",
    this.radioGroup1 = "",
    this.mealDetailsModelObj,
  });

  MealDetailsModel? mealDetailsModelObj;

  String radioGroup;

  String radioGroup1;

  @override
  List<Object?> get props => [
        radioGroup,
        radioGroup1,
        mealDetailsModelObj,
      ];
  MealDetailsState copyWith({
    String? radioGroup,
    String? radioGroup1,
    MealDetailsModel? mealDetailsModelObj,
  }) {
    return MealDetailsState(
      radioGroup: radioGroup ?? this.radioGroup,
      radioGroup1: radioGroup1 ?? this.radioGroup1,
      mealDetailsModelObj: mealDetailsModelObj ?? this.mealDetailsModelObj,
    );
  }
}
