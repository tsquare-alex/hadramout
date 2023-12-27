// ignore_for_file: must_be_immutable

part of 'home_bage_bloc.dart';

/// Represents the state of HomeBage in the application.
class HomeBageState extends Equatable {
  HomeBageState({
    this.searchController,
    this.sliderIndex = 0,
    this.homeBageModelObj,
  });

  TextEditingController? searchController;

  HomeBageModel? homeBageModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        searchController,
        sliderIndex,
        homeBageModelObj,
      ];
  HomeBageState copyWith({
    TextEditingController? searchController,
    int? sliderIndex,
    HomeBageModel? homeBageModelObj,
  }) {
    return HomeBageState(
      searchController: searchController ?? this.searchController,
      sliderIndex: sliderIndex ?? this.sliderIndex,
      homeBageModelObj: homeBageModelObj ?? this.homeBageModelObj,
    );
  }
}
