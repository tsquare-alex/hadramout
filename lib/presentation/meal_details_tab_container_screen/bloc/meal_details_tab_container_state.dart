// ignore_for_file: must_be_immutable

part of 'meal_details_tab_container_bloc.dart';

/// Represents the state of MealDetailsTabContainer in the application.
class MealDetailsTabContainerState extends Equatable {
  MealDetailsTabContainerState({this.mealDetailsTabContainerModelObj});

  MealDetailsTabContainerModel? mealDetailsTabContainerModelObj;

  @override
  List<Object?> get props => [
        mealDetailsTabContainerModelObj,
      ];
  MealDetailsTabContainerState copyWith(
      {MealDetailsTabContainerModel? mealDetailsTabContainerModelObj}) {
    return MealDetailsTabContainerState(
      mealDetailsTabContainerModelObj: mealDetailsTabContainerModelObj ??
          this.mealDetailsTabContainerModelObj,
    );
  }
}
